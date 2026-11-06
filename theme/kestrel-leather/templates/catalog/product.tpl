{**
 * Kestrel Leather product page.
 * - Over the name: the reference and the leather.
 * - The free monogram field sits between the colours and "Add to bag" (catalog/_partials/product-customization.tpl).
 * - Under the photo and buy box: "How it ages" for leather that darkens with use (the Theme Kit stamp feature,
 *   here "Patina"), then "Made of": the features as one ruled row, the description and an accordion.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
{extends file='parent:catalog/product.tpl'}

{block name='product_header'}
  {assign var=kl_leather value=''}
  {* The first feature is the leather; a product with one feature (the care balm) only shows its reference. *}
  {if count($product.features) > 1}{assign var=kl_leather value=$product.features[0].value}{/if}
  {if $product.reference || $kl_leather}
    <p class="kl-ref">{if $product.reference}{$product.reference|regex_replace:'/^([A-Za-z]+-[0-9]+)-[0-9]+$/':'$1'}{/if}{if $product.reference && $kl_leather} · {/if}{$kl_leather}</p>
  {/if}
  {$smarty.block.parent}
{/block}

{* The monogram field is shown inside the buy form, after the colours. *}
{block name='product_customization'}{/block}

{block name='product_variants'}
  {$smarty.block.parent}
  {if $product.is_customizable && count($product.customizations.fields)}
    {include file='catalog/_partials/product-customization.tpl' customizations=$product.customizations}
  {/if}
{/block}

{block name='product_tabs'}
  {include file='catalog/_partials/kl-ages.tpl'}
  <section class="kl-made" aria-labelledby="kl-made-title">
    <h2 class="kl-made__title" id="kl-made-title">{l s='Made of' d='Modules.Hbkit.Shop'}</h2>
    <div class="kl-made__body">
      {if $product.features}
        <dl class="kl-made__specs">
          {foreach from=$product.features item=feature}
            {if $feature.id_feature != $modules.hbkit.stamp_feature}
              <div class="kl-made__spec"><dt>{$feature.name}</dt><dd>{$feature.value}</dd></div>
            {/if}
          {/foreach}
        </dl>
      {/if}
      {if $product.description}
        <div class="kl-made__desc product__description rich-text">{$product.description nofilter}</div>
      {/if}
      <div class="product__accordion accordion accordion-flush" id="product_accordion">
        <div class="accordion-item" id="kl_care">
          <h3 class="accordion-header" id="kl_care_heading">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#kl_care_collapse" aria-expanded="false" aria-controls="kl_care_collapse">
              {l s='Leather care' d='Modules.Hbkit.Shop'}
            </button>
          </h3>
          <div id="kl_care_collapse" class="accordion-collapse collapse" aria-labelledby="kl_care_heading">
            <div class="accordion-body">{l s='Wipe with a soft, dry cloth. Feed the leather with balm once or twice a year, and let it dry slowly if it gets wet.' d='Modules.Hbkit.Shop'}</div>
          </div>
        </div>
        {capture name='kl_reassurance'}{hook h='displayReassurance'}{/capture}
        {if $smarty.capture.kl_reassurance|trim}
          <div class="accordion-item" id="kl_delivery">
            <h3 class="accordion-header" id="kl_delivery_heading">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#kl_delivery_collapse" aria-expanded="false" aria-controls="kl_delivery_collapse">
                {l s='Delivery and returns' d='Modules.Hbkit.Shop'}
              </button>
            </h3>
            <div id="kl_delivery_collapse" class="accordion-collapse collapse" aria-labelledby="kl_delivery_heading">
              <div class="accordion-body">{$smarty.capture.kl_reassurance nofilter}</div>
            </div>
          </div>
        {/if}
        {foreach from=$product.extraContent item=extra key=extraKey}
          <div class="accordion-item" id="extra_{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
            <h3 class="accordion-header" id="product_extra_{$extraKey}_heading">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#product_extra_{$extraKey}_collapse" aria-expanded="false" aria-controls="product_extra_{$extraKey}_collapse">
                {$extra.title}
              </button>
            </h3>
            <div id="product_extra_{$extraKey}_collapse" class="accordion-collapse collapse" aria-labelledby="product_extra_{$extraKey}_heading">
              <div class="accordion-body">{$extra.content nofilter}</div>
            </div>
          </div>
        {/foreach}
      </div>
    </div>
  </section>
{/block}

{* The delivery and returns promises are in the accordion above. *}
{block name='hook_display_reassurance'}{/block}
