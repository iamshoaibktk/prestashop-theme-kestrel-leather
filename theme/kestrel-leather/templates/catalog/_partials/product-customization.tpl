{**
 * Kestrel Leather: the free monogram. The product's first text field (the demo's "Initials") as a short field with the
 * letters stamped into a leather swatch beside it. It sits inside the buy form, so there is no form or "Save" button
 * here: custom.js saves the initials with PrestaShop's customization when "Add to bag" is pressed.
 * PrestaShop replaces this block (.js-product-customization) when the colour changes; custom.js keeps what was typed.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
{if !$configuration.is_catalog}
  {assign var=kl_field value=null}
  {foreach from=$customizations.fields item=field}
    {if !$kl_field && $field.type === 'text'}{assign var=kl_field value=$field}{/if}
  {/foreach}
  {if $kl_field}
    <div class="kl-mono product-customization js-product-customization" data-input="{$kl_field.input_name}" data-saved="{$kl_field.text|escape:'html':'UTF-8'}">
      <div class="kl-mono__form">
        <label class="kl-mono__label" for="kl-ini">{l s='Add your initials' d='Modules.Hbkit.Shop'} <span>({l s='free' d='Modules.Hbkit.Shop'})</span></label>
        <input id="kl-ini" class="kl-mono__input js-kl-ini" type="text" name="{$kl_field.input_name}" value="{$kl_field.text|escape:'html':'UTF-8'}" maxlength="3" autocomplete="off" autocapitalize="characters" spellcheck="false" placeholder="ABC" aria-describedby="kl-ini-help"{if $kl_field.required} required{/if}>
        <p class="kl-mono__help" id="kl-ini-help">{l s='Up to 3 letters, heat-stamped by hand. Leave it empty for no initials.' d='Modules.Hbkit.Shop'}</p>
        <p class="kl-mono__error js-kl-ini-error" role="alert" hidden>{l s='Your initials could not be saved. Please try again.' d='Modules.Hbkit.Shop'}</p>
      </div>
      <div class="kl-mono__leather kl-leather js-kl-tint" aria-hidden="true"><span class="kl-stamp js-kl-stamp"></span></div>
    </div>
  {/if}
{/if}
