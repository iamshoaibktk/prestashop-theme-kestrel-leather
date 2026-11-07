# Kestrel Leather: Free PrestaShop 9 Theme for Leather Goods and Bag Stores

Kestrel Leather is a free PrestaShop 9 theme for leather goods, bag, wallet and belt shops. It is a dark, responsive Hummingbird child theme where customers type their initials and see them stamped into the leather before they buy, and swatches show how the leather darkens with age. It comes with AJAX add to bag in a side cart, filters always open on category pages, a one-click demo in 10 languages and the free Hummingbird Theme Kit module.

**[Live demo](https://iamshoaibktk.github.io/prestashop-theme-kestrel-leather/)** | **[Download the free theme](https://github.com/iamshoaibktk/prestashop-theme-kestrel-leather/releases/latest)**

![Kestrel Leather: a Hummingbird child theme for PrestaShop 9](screenshots/readme-cover.jpg)

![Kestrel Leather category page, product page, add to cart and the Theme Kit back office](screenshots/readme-pages.jpg)

![Kestrel Leather on a phone: home, category and product](screenshots/readme-phones.jpg)


## Features of this free PrestaShop 9 theme

- **Free monogram with a live preview**: an "Add your initials" field on the product page stamps the letters into a leather swatch as you type, in the chosen colour. The initials are saved as a PrestaShop customization and show in the bag, the cart and the order.
- **How it ages**: three swatches show the chosen leather new, after one year and after five years, on the homepage and on every vegetable-tanned or full-grain piece.
- **A dark workshop look**: Espresso pages, brass for the main action, Instrument Serif headings and a Made of row with the leather, lining, hardware and origin.
- **AJAX add to bag**: a side bag with the initials on each line and the free-delivery bar, and category filters that stay open in the left column.
- **Child theme of Hummingbird** (`parent: hummingbird`). No parent templates are copied, so Hummingbird and PrestaShop updates keep working.
- **Hummingbird Theme Kit module** (`hbkit` v1.1.3): colours, fonts, corners, header and footer style as CSS variables, a top bar, and a homepage builder (banners, categories, faq, hero, image text, products, testimonials).
- **Page layouts you can switch in the back office**: side cart, cart page, category pages, product page and product cards, each with several picture-chosen styles. This demo uses: side cart that slides in; ruled cart page with framed summary; filters in the left column; split category header; classic product page; details in an accordion; 3 products per row; plain product cards.
- **One-click demo import**: 23 products with sizes/colours and features, 6 categories, brands, 8 CMS pages, main menu, footer links, reassurance blocks and 8 homepage sections.
- **10 languages** for everything: English, French, Spanish, Italian, Polish, German, Czech, Dutch, Portuguese, Russian.
- Self-hosted fonts (SIL Open Font License), no external font or tracking calls.

## Requirements

- PrestaShop 9.2 or newer with the Hummingbird theme (installed by default)
- PHP 8.1+

## Installation

1. Download the release files: `kestrel-leather-theme-v1.0.3.zip` and `hbkit-v1.1.3.zip`.
2. **Modules > Module Manager > Upload a module**: upload `hbkit-v1.1.3.zip`.
3. **Design > Theme & Logo > Add new theme**: upload `kestrel-leather-theme-v1.0.3.zip`, then click *Use this theme*.
4. **Design > Theme Kit > Demo import**: pick *Kestrel Leather*, type `IMPORT` and click *Import this demo*.
   On a fresh shop keep *Remove existing content first* checked. Orders and customers are never touched.
5. Adjust colours, fonts and page layouts in **Theme Kit > Design**, and every homepage section in **Theme Kit > Homepage sections**.

## Customising safely

- Put your CSS in `themes/kestrel-leather/assets/css/custom.css`.
- Colours, fonts, spacing and page layouts are settings in Theme Kit > Design; no template edits needed.
- To change a template, copy only the block you need with `{extends file='parent:...'}` instead of copying the whole file.

## Credits

- Photos: see [CREDITS.md](CREDITS.md) (Pixabay Content License).
- Fonts: SIL Open Font License 1.1 (licence files in `theme/kestrel-leather/assets/fonts/`).
- Kestrel Leather and its brands are fictional and created for this demo.


## Frequently asked questions

**Is Kestrel Leather free?**
Yes. It is a free and open-source PrestaShop theme under the AFL-3.0 licence. You can use it on personal and commercial shops.

**Which PrestaShop versions does it support?**
PrestaShop 9.2 and newer, with PHP 8.1 or newer. It is a child theme of Hummingbird, the default theme of PrestaShop 9.

**Will PrestaShop or Hummingbird updates break it?**
No parent template is copied. The theme only adds its own styles and the few templates it changes, so updates to Hummingbird and PrestaShop keep working.

**Which languages are included?**
All texts and the demo content come in 10 languages: English, French, Spanish, Italian, Polish, German, Czech, Dutch, Portuguese, Russian.

**Can I use it for a different kind of shop?**
Yes. It is made for a leather goods store, but colours, fonts, page layouts and every homepage section are settings in Theme Kit, and the demo content can be removed.

**Can I see it before installing?**
Yes: the [live demo](https://iamshoaibktk.github.io/prestashop-theme-kestrel-leather/) is a static copy of the demo store. The cart, account and search work once the theme is installed on PrestaShop.

**Where can I get help, or a custom PrestaShop theme or module?**
Contact the author below: installation help, custom demos and PrestaShop modules.

## Licence

Academic Free License 3.0 (AFL-3.0), see [LICENSE.md](LICENSE.md).

## More free PrestaShop 9 themes

- [Maison Vellor](https://github.com/iamshoaibktk/prestashop-theme-maison-vellor): free PrestaShop 9 theme for fashion boutiques
- [Northline Outfitters](https://github.com/iamshoaibktk/prestashop-theme-northline-outfitters): free PrestaShop 9 theme for outdoor clothing stores
- [Little Sprout](https://github.com/iamshoaibktk/prestashop-theme-little-sprout): free PrestaShop 9 theme for baby and kids' clothing stores
- [Stride Atelier](https://github.com/iamshoaibktk/prestashop-theme-stride-atelier): free PrestaShop 9 theme for shoe and sneaker stores
- [Aurelle Jewels](https://github.com/iamshoaibktk/prestashop-theme-aurelle-jewels): free PrestaShop 9 theme for jewellery and ring stores

## Author & support

Muhammad Shoaib — iamshoaibktk@gmail.com · WhatsApp +923459016286 · [Fiverr](https://www.fiverr.com/shoaibktk)
Need installation help, a custom demo or a PrestaShop module? Get in touch.
