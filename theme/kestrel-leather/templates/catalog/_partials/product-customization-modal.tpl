{**
 * Kestrel Leather: on a cart line, what the customer typed (the initials) is shown on the line itself, like in the
 * side cart, instead of behind a "Customized" button and a pop-up. Uploaded pictures are shown as a small image.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
<div class="kl-line-custom">
  {foreach from=$product.customizations item='customization'}
    {foreach from=$customization.fields item='field'}
      {if $field.type == 'text' && $field.text !== ''}
        <p class="kl-line-custom__item"><b class="kl-line-custom__text">{$field.text}</b> <span class="kl-line-custom__label">{$field.label}</span></p>
      {elseif $field.type == 'image' && !empty($field.image.small.url)}
        <img class="kl-line-custom__image" src="{$field.image.small.url}" alt="{$field.label|escape:'html':'UTF-8'}" width="48" height="48" loading="lazy">
      {/if}
    {/foreach}
  {/foreach}
</div>
