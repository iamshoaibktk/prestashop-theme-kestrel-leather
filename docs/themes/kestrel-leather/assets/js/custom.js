/**
 * Kestrel Leather:
 * - the initials field (product page, quick view and the home page band) stamps the letters into the leather as you type;
 * - the stamp and the "How it ages" swatches take the colour that is chosen;
 * - "Add to bag" first saves the initials as the product's PrestaShop customization, then adds the piece with them.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 */
(function () {
  // Letters only (Latin, accented and Cyrillic), at most three, in capitals.
  function clean(value) {
    return (value || '').toUpperCase().replace(/[^A-ZÀ-ÖØ-ÞĀ-ſЀ-ӿ]/g, '').slice(0, 3);
  }
  function stamp(letters) {
    return letters ? letters.split('').join('.') + '.' : '';
  }

  function scopeOf(el) {
    return el.closest('.quickview, .js-product-container, .product-container, #main') || document;
  }

  // The chosen colour, as shown on its swatch.
  function chosenColour(scope) {
    var input = scope.querySelector('.input-color__input:checked');
    var swatch = input && scope.querySelector('label[for="' + input.id + '"] .color');
    if (!swatch) return '';
    var c = window.getComputedStyle(swatch).backgroundColor;
    return c && c !== 'rgba(0, 0, 0, 0)' && c !== 'transparent' ? c : '';
  }

  function tint(scope) {
    var colour = chosenColour(scope);
    scope.querySelectorAll('.js-kl-tint').forEach(function (el) {
      if (colour) el.style.setProperty('--kl-leather', colour); else el.style.removeProperty('--kl-leather');
    });
  }

  // What was typed survives PrestaShop's refresh of the block when the colour changes.
  var typed = null;

  function syncField(input) {
    var letters = clean(input.value);
    if (input.value !== letters) input.value = letters;
    var box = input.closest('.js-product-customization');
    var out = box && box.querySelector('.js-kl-stamp');
    // Empty: the placeholder letters, faint. Only write when it changed: the page watches for changes and would run this again.
    var shown = stamp(letters) || stamp(clean(input.getAttribute('placeholder')));
    if (out && out.textContent !== shown) out.textContent = shown;
    if (box) box.classList.toggle('is-empty', !letters);
    var err = box && box.querySelector('.js-kl-ini-error');
    if (err) err.hidden = true;
  }

  // "Colour : Cognac" from PrestaShop becomes "Colour: Cognac".
  function tidyLabels(root) {
    (root || document).querySelectorAll('.product-variant__selected').forEach(function (el) {
      var t = el.textContent.replace(/^\s*:\s*/, ': ').replace(/\s+$/, '');
      if (el.textContent !== t) el.textContent = t;
    });
  }

  function setup(root) {
    tidyLabels(root);
    (root || document).querySelectorAll('.js-kl-ini').forEach(function (input) {
      if (typed !== null && input.closest('.js-product-customization') && !input.dataset.klReady) input.value = typed;
      input.dataset.klReady = '1';
      syncField(input);
      tint(scopeOf(input));
    });
    (root || document).querySelectorAll('.kl-patina').forEach(function (el) { tint(scopeOf(el)); });
  }

  document.addEventListener('input', function (e) {
    var t = e.target;
    if (t.classList && t.classList.contains('js-kl-ini')) {
      syncField(t);
      typed = t.value;
    } else if (t.classList && t.classList.contains('js-kl-try')) {
      var letters = clean(t.value);
      if (t.value !== letters) t.value = letters;
      var out = document.querySelector('.js-kl-try-stamp');
      if (out) out.textContent = stamp(letters) || out.getAttribute('data-empty') || '';
    }
  });

  document.addEventListener('change', function (e) {
    if (e.target.classList && e.target.classList.contains('input-color__input')) tint(scopeOf(e.target));
  });

  // Enter in the initials field adds to the bag instead of sending the form unchecked.
  document.addEventListener('keydown', function (e) {
    if (e.key !== 'Enter' || !e.target.classList || !e.target.classList.contains('js-kl-ini')) return;
    e.preventDefault();
    var btn = scopeOf(e.target).querySelector('[data-button-action="add-to-cart"]');
    if (btn && !btn.disabled) btn.click();
  });

  // Save the initials, then let PrestaShop add the product with the customization it returns.
  document.addEventListener('click', function (e) {
    var btn = e.target.closest && e.target.closest('[data-button-action="add-to-cart"]');
    if (!btn || btn.classList.contains('product-miniature__add')) return;
    if (btn.dataset.klPass === '1') { btn.dataset.klPass = ''; return; }
    var scope = scopeOf(btn);
    var input = scope.querySelector('.js-kl-ini');
    var form = btn.closest('form');
    var idField = form && form.querySelector('.js-product-customization-id, [name="id_customization"]');
    if (!input || !idField) return;
    var box = input.closest('.js-product-customization');
    var letters = clean(input.value);
    if (!letters) {
      idField.value = '0';
      return;
    }
    e.preventDefault();
    e.stopImmediatePropagation();
    var body = new FormData();
    // Saved as stamped ("T.R."), so the bag, the order and the workshop read the same as the preview.
    body.append(box.getAttribute('data-input'), stamp(letters));
    body.append('submitCustomizedData', '1');
    var idProduct = form.querySelector('[name="id_product"]');
    if (!idProduct) return;
    // The product page itself saves the text (submitCustomizedData), creating the cart if needed, and shows the
    // customization id in its buy form. (The lighter ajax refresh call does not keep a new cart in the cookie.)
    var base = window.prestashop && prestashop.urls ? prestashop.urls.base_url : '/';
    var url = base + 'index.php?controller=product&id_product=' + encodeURIComponent(idProduct.value);
    btn.classList.add('is-saving');
    btn.disabled = true;
    fetch(url, { method: 'POST', body: body, credentials: 'same-origin' })
      .then(function (r) { return r.text(); })
      .then(function (html) {
        var m = html.match(/name="id_customization"\s+value="(\d+)"/);
        if (!m || m[1] === '0') throw new Error('no customization');
        idField.value = m[1];
        box.setAttribute('data-saved', letters);
        btn.disabled = false;
        btn.classList.remove('is-saving');
        btn.dataset.klPass = '1';
        btn.click();
      })
      .catch(function () {
        btn.disabled = false;
        btn.classList.remove('is-saving');
        var err = box.querySelector('.js-kl-ini-error');
        if (err) err.hidden = false;
      });
  }, true);

  var queued = false;
  function queue() {
    if (queued) return;
    queued = true;
    window.requestAnimationFrame(function () { queued = false; setup(); });
  }

  function init() {
    setup();
    new MutationObserver(queue).observe(document.body, { childList: true, subtree: true });
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init); else init();
})();
