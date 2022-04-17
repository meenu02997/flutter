// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.menuCategory,
    this.modProductSliders,
    this.slider,
    this.banners,
    this.productBlock,
    this.languages,
    this.currencies,
    this.appReferenceVersion,
    this.guestCheckout,
    this.notificationCount,
    this.searchWordLength,
    this.idLangDefault,
    this.isoLangDefault,
    this.idCurrencyDefault,
    this.isoCurrencyDefault,
    this.playStoreUrl,
    this.cmsTabs,
    this.enableOptin,
    this.enableShop,
    this.themeColor,
    this.moduleBlockwishlist,
    this.moduleProductcomments,
    this.profilePictureUploadUrl,
    this.requestProtocol,
    this.isPs17,
    this.consentBox,
  });

  MenuCategory menuCategory;
  ModProductSliders modProductSliders;
  Slider slider;
  Banners banners;
  ProductBlock productBlock;
  Languages languages;
  Currencies currencies;
  String appReferenceVersion;
  String guestCheckout;
  String notificationCount;
  String searchWordLength;
  String idLangDefault;
  String isoLangDefault;
  String idCurrencyDefault;
  String isoCurrencyDefault;
  String playStoreUrl;
  CmsTabs cmsTabs;
  String enableOptin;
  String enableShop;
  ThemeColor themeColor;
  String moduleBlockwishlist;
  String moduleProductcomments;
  String profilePictureUploadUrl;
  String requestProtocol;
  String isPs17;
  String consentBox;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    menuCategory: MenuCategory.fromJson(json["menu_category"]),
    modProductSliders: ModProductSliders.fromJson(json["mod_product_sliders"]),
    slider: Slider.fromJson(json["slider"]),
    banners: Banners.fromJson(json["banners"]),
    productBlock: ProductBlock.fromJson(json["product_block"]),
    languages: Languages.fromJson(json["languages"]),
    currencies: Currencies.fromJson(json["currencies"]),
    appReferenceVersion: json["app_reference_version"],
    guestCheckout: json["guest_checkout"],
    notificationCount: json["notification_count"],
    searchWordLength: json["search_word_length"],
    idLangDefault: json["id_lang_default"],
    isoLangDefault: json["iso_lang_default"],
    idCurrencyDefault: json["id_currency_default"],
    isoCurrencyDefault: json["iso_currency_default"],
    playStoreUrl: json["play_store_url"],
    cmsTabs: CmsTabs.fromJson(json["cms_tabs"]),
    enableOptin: json["enable_optin"],
    enableShop: json["enable_shop"],
    themeColor: ThemeColor.fromJson(json["theme_color"]),
    moduleBlockwishlist: json["module_blockwishlist"],
    moduleProductcomments: json["module_productcomments"],
    profilePictureUploadUrl: json["profile_picture_upload_url"],
    requestProtocol: json["request_protocol"],
    isPs17: json["is_ps17"],
    consentBox: json["consent_box"],
  );

  Map<String, dynamic> toJson() => {
    "menu_category": menuCategory.toJson(),
    "mod_product_sliders": modProductSliders.toJson(),
    "slider": slider.toJson(),
    "banners": banners.toJson(),
    "product_block": productBlock.toJson(),
    "languages": languages.toJson(),
    "currencies": currencies.toJson(),
    "app_reference_version": appReferenceVersion,
    "guest_checkout": guestCheckout,
    "notification_count": notificationCount,
    "search_word_length": searchWordLength,
    "id_lang_default": idLangDefault,
    "iso_lang_default": isoLangDefault,
    "id_currency_default": idCurrencyDefault,
    "iso_currency_default": isoCurrencyDefault,
    "play_store_url": playStoreUrl,
    "cms_tabs": cmsTabs.toJson(),
    "enable_optin": enableOptin,
    "enable_shop": enableShop,
    "theme_color": themeColor.toJson(),
    "module_blockwishlist": moduleBlockwishlist,
    "module_productcomments": moduleProductcomments,
    "profile_picture_upload_url": profilePictureUploadUrl,
    "request_protocol": requestProtocol,
    "is_ps17": isPs17,
    "consent_box": consentBox,
  };
}

class Banners {
  Banners({
    this.banner,
  });

  List<Banner> banner;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    this.imageLink,
    this.page,
    this.idPage,
    this.url,
    this.productName,
    this.idProductAttribute,
    this.categoryName,
  });

  String imageLink;
  String page;
  String idPage;
  ThemeColor url;
  String productName;
  String idProductAttribute;
  String categoryName;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    imageLink: json["image_link"],
    page: json["page"],
    idPage: json["id_page"],
    url: ThemeColor.fromJson(json["url"]),
    productName: json["product_name"] == null ? null : json["product_name"],
    idProductAttribute: json["id_product_attribute"],
    categoryName: json["category_name"] == null ? null : json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "image_link": imageLink,
    "page": page,
    "id_page": idPage,
    "url": url.toJson(),
    "product_name": productName == null ? null : productName,
    "id_product_attribute": idProductAttribute,
    "category_name": categoryName == null ? null : categoryName,
  };
}

class ThemeColor {
  ThemeColor();

  factory ThemeColor.fromJson(Map<String, dynamic> json) => ThemeColor(
  );

  Map<String, dynamic> toJson() => {
  };
}

class CmsTabs {
  CmsTabs({
    this.tab,
  });

  List<String> tab;

  factory CmsTabs.fromJson(Map<String, dynamic> json) => CmsTabs(
    tab: List<String>.from(json["tab"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "tab": List<dynamic>.from(tab.map((x) => x)),
  };
}

class Currencies {
  Currencies({
    this.currency,
  });

  List<Currency> currency;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
    currency: List<Currency>.from(json["currency"].map((x) => Currency.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "currency": List<dynamic>.from(currency.map((x) => x.toJson())),
  };
}

class Currency {
  Currency({
    this.idCurrency,
    this.name,
    this.isoCode,
    this.sign,
  });

  String idCurrency;
  String name;
  String isoCode;
  String sign;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    idCurrency: json["id_currency"],
    name: json["name"],
    isoCode: json["iso_code"],
    sign: json["sign"],
  );

  Map<String, dynamic> toJson() => {
    "id_currency": idCurrency,
    "name": name,
    "iso_code": isoCode,
    "sign": sign,
  };
}

class Languages {
  Languages({
    this.language,
  });

  List<Language> language;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
    language: List<Language>.from(json["language"].map((x) => Language.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "language": List<dynamic>.from(language.map((x) => x.toJson())),
  };
}

class Language {
  Language({
    this.idLang,
    this.name,
    this.isoCode,
    this.icon,
  });

  String idLang;
  String name;
  String isoCode;
  String icon;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    idLang: json["id_lang"],
    name: json["name"],
    isoCode: json["iso_code"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id_lang": idLang,
    "name": name,
    "iso_code": isoCode,
    "icon": icon,
  };
}

class MenuCategory {
  MenuCategory({
    this.rootCategory,
  });

  List<RootCategory> rootCategory;

  factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
    rootCategory: List<RootCategory>.from(json["root_category"].map((x) => RootCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "root_category": List<dynamic>.from(rootCategory.map((x) => x.toJson())),
  };
}

class RootCategory {
  RootCategory({
    this.idCategory,
    this.name,
    this.imgIcon,
    this.children,
  });

  String idCategory;
  String name;
  String imgIcon;
  List<Child> children;

  factory RootCategory.fromJson(Map<String, dynamic> json) => RootCategory(
    idCategory: json["id_category"],
    name: json["name"],
    imgIcon: json["img_icon"],
    children: json["children"] == null ? null : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_category": idCategory,
    "name": name,
    "img_icon": imgIcon,
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class Child {
  Child({
    this.idCategory,
    this.name,
  });

  String idCategory;
  String name;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    idCategory: json["id_category"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id_category": idCategory,
    "name": name,
  };
}

class ModProductSliders {
  ModProductSliders({
    this.modProductSlider,
  });

  List<ModProductSlider> modProductSlider;

  factory ModProductSliders.fromJson(Map<String, dynamic> json) => ModProductSliders(
    modProductSlider: List<ModProductSlider>.from(json["mod_product_slider"].map((x) => ModProductSlider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mod_product_slider": List<dynamic>.from(modProductSlider.map((x) => x.toJson())),
  };
}

class ModProductSlider {
  ModProductSlider({
    this.title,
    this.linkRewrite,
    this.modProductList,
  });

  String title;
  String linkRewrite;
  ModProductList modProductList;

  factory ModProductSlider.fromJson(Map<String, dynamic> json) => ModProductSlider(
    title: json["title"],
    linkRewrite: json["link_rewrite"],
    modProductList: ModProductList.fromJson(json["mod_product_list"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link_rewrite": linkRewrite,
    "mod_product_list": modProductList.toJson(),
  };
}

class ModProductList {
  ModProductList({
    this.modProduct,
  });

  List<ModProduct> modProduct;

  factory ModProductList.fromJson(Map<String, dynamic> json) => ModProductList(
    modProduct: List<ModProduct>.from(json["mod_product"].map((x) => ModProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mod_product": List<dynamic>.from(modProduct.map((x) => x.toJson())),
  };
}

class ModProduct {
  ModProduct({
    this.idProduct,
    this.name,
    this.idProductAttribute,
    this.price,
    this.reductionAmount,
    this.oldPrice,
    this.imageLink,
    this.displayAddtocart,
    this.showPrice,
    this.quantity,
  });

  String idProduct;
  String name;
  String idProductAttribute;
  String price;
  String reductionAmount;
  String oldPrice;
  String imageLink;
  String displayAddtocart;
  String showPrice;
  String quantity;

  factory ModProduct.fromJson(Map<String, dynamic> json) => ModProduct(
    idProduct: json["id_product"],
    name: json["name"],
    idProductAttribute: json["id_product_attribute"],
    price: json["price"],
    reductionAmount: json["reduction_amount"] == null ? null : json["reduction_amount"],
    oldPrice: json["old_price"] == null ? null : json["old_price"],
    imageLink: json["image_link"],
    displayAddtocart: json["display_addtocart"],
    showPrice: json["show_price"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id_product": idProduct,
    "name": name,
    "id_product_attribute": idProductAttribute,
    "price": price,
    "reduction_amount": reductionAmount == null ? null : reductionAmount,
    "old_price": oldPrice == null ? null : oldPrice,
    "image_link": imageLink,
    "display_addtocart": displayAddtocart,
    "show_price": showPrice,
    "quantity": quantity,
  };
}

class ProductBlock {
  ProductBlock({
    this.block,
  });

  List<Block> block;

  factory ProductBlock.fromJson(Map<String, dynamic> json) => ProductBlock(
    block: List<Block>.from(json["block"].map((x) => Block.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "block": List<dynamic>.from(block.map((x) => x.toJson())),
  };
}

class Block {
  Block({
    this.title,
    this.idProductBlock,
    this.products,
  });

  String title;
  String idProductBlock;
  Products products;

  factory Block.fromJson(Map<String, dynamic> json) => Block(
    title: json["title"],
    idProductBlock: json["id_product_block"],
    products: Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id_product_block": idProductBlock,
    "products": products.toJson(),
  };
}

class Products {
  Products({
    this.product,
  });

  List<Product> product;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product": List<dynamic>.from(product.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.idProduct,
    this.name,
    this.idProductAttribute,
    this.price,
    this.imageLink,
    this.showPrice,
    this.displayAddtocart,
  });

  String idProduct;
  String name;
  String idProductAttribute;
  String price;
  String imageLink;
  String showPrice;
  String displayAddtocart;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    idProduct: json["id_product"],
    name: json["name"],
    idProductAttribute: json["id_product_attribute"],
    price: json["price"],
    imageLink: json["image_link"],
    showPrice: json["show_price"],
    displayAddtocart: json["display_addtocart"],
  );

  Map<String, dynamic> toJson() => {
    "id_product": idProduct,
    "name": name,
    "id_product_attribute": idProductAttribute,
    "price": price,
    "image_link": imageLink,
    "show_price": showPrice,
    "display_addtocart": displayAddtocart,
  };
}

class Slider {
  Slider({
    this.slide,
  });

  List<Banner> slide;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    slide: List<Banner>.from(json["slide"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "slide": List<dynamic>.from(slide.map((x) => x.toJson())),
  };
}
