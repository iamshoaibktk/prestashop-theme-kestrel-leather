{**
 * Kestrel Leather: an image and text section with the style name "kl-monogram" becomes the monogram band.
 * The title, text and link come from the section; the photo (a leather swatch) gets an initials field and the
 * letters stamped into it, live (custom.js). Every other image and text section uses Theme Kit's own template.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
{if $s.css|default:'' == 'kl-monogram' && $section.items}
  {assign var=item value=$section.items[0]}
  <div class="kl-band" id="kl-monogram">
    <div class="kl-band__body">
      {if $item.title}<h2 class="kl-band__title">{$item.title}</h2>{/if}
      {if $item.text}<div class="kl-band__text">{$item.text nofilter}</div>{/if}
      <label class="kl-band__label" for="kl-try">{l s='Your initials' d='Modules.Hbkit.Shop'} <span>({l s='up to 3 letters' d='Modules.Hbkit.Shop'})</span></label>
      <input id="kl-try" class="kl-mono__input js-kl-try" type="text" maxlength="3" autocomplete="off" autocapitalize="characters" spellcheck="false" placeholder="KL">
      {if $item.button && $item.href}<a class="kl-band__link" href="{$item.href}">{$item.button}</a>{/if}
    </div>
    <div class="kl-band__leather kl-leather"{if !empty($item.image_url)} style="background-image:url('{$item.image_url}')"{/if}>
      <span class="kl-stamp js-kl-try-stamp" aria-live="polite" data-empty="K.L.">K.L.</span>
    </div>
  </div>
{else}
  {include file="{$smarty.const._PS_MODULE_DIR_}hbkit/views/templates/hook/sections/image_text.tpl"}
{/if}
