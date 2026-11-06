{**
 * Kestrel Leather product card: one small mark on the photo (a sale or stock flag first, then "Free monogram" on
 * pieces with an initials field, then "New"), the name in the serif, the price with the colours at the end of the row, then the
 * leather and hardware (Theme Kit card labels) as one quiet line.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
{extends file='parent:catalog/_partials/miniatures/product.tpl'}

{block name='product_miniature_top'}
  <div class="product-miniature__top">
    {assign var=kl_flag value=null}
    {foreach from=$product.flags item=flag}{if !$kl_flag && $flag.type != 'new'}{assign var=kl_flag value=$flag}{/if}{/foreach}
    {if $kl_flag}
      <ul class="product-flags js-product-flags"><li class="badge {$kl_flag.type}">{$kl_flag.label nofilter}</li></ul>
    {elseif !empty($product.customizable)}
      <ul class="product-flags js-product-flags"><li class="badge kl-flag-mono">{l s='Free monogram' d='Modules.Hbkit.Shop'}</li></ul>
    {elseif !empty($product.flags)}
      {include file='catalog/_partials/product-flags.tpl'}
    {/if}
    {include file='catalog/_partials/miniatures/product-image.tpl'}
    {include file='catalog/_partials/miniatures/product-quickview.tpl'}
  </div>
{/block}

{* Colours are shown at the end of the price row. *}
{block name='product_variants'}{/block}

{block name='product_discount_price'}
  {if $product.has_discount}
    <span class="product-miniature__regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
  {/if}
  {if $product.main_variants}<span class="product-miniature__variants kl-card__dots">{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}</span>{/if}
{/block}
