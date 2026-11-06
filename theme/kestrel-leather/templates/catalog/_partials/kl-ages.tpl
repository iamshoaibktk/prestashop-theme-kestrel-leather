{**
 * Kestrel Leather: "How it ages". Shown for leather with the Theme Kit stamp feature (here "Patina: darkens with use").
 * Three swatches of the chosen colour on the leather photo, each darker and warmer (custom.css, colour set by custom.js).
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
{assign var=kl_patina value=false}
{if $modules.hbkit.stamp_feature}
  {foreach from=$product.features item=feature}
    {if $feature.id_feature == $modules.hbkit.stamp_feature}{assign var=kl_patina value=true}{/if}
  {/foreach}
{/if}
{if $kl_patina}
  <section class="kl-patina js-kl-tint" aria-labelledby="kl-patina-title">
    <div class="kl-patina__head">
      <h2 class="kl-patina__title" id="kl-patina-title">{l s='How it ages' d='Modules.Hbkit.Shop'}</h2>
      <p class="kl-patina__text">{l s='The leather darkens and softens with every year of use. Light, hands and rain all leave their mark, and no two pieces age the same.' d='Modules.Hbkit.Shop'}</p>
    </div>
    <div class="kl-patina__row">
      <figure class="kl-age kl-age--1"><span class="kl-leather" aria-hidden="true"></span><figcaption><b>{l s='New' d='Modules.Hbkit.Shop'}</b><span>{l s='Light and firm' d='Modules.Hbkit.Shop'}</span></figcaption></figure>
      <figure class="kl-age kl-age--2"><span class="kl-leather" aria-hidden="true"></span><figcaption><b>{l s='After 1 year' d='Modules.Hbkit.Shop'}</b><span>{l s='Softer, warmer' d='Modules.Hbkit.Shop'}</span></figcaption></figure>
      <figure class="kl-age kl-age--3"><span class="kl-leather" aria-hidden="true"></span><figcaption><b>{l s='After 5 years' d='Modules.Hbkit.Shop'}</b><span>{l s='Deep patina' d='Modules.Hbkit.Shop'}</span></figcaption></figure>
    </div>
  </section>
{/if}
