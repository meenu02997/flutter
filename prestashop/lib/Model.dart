// To parse this JSON data, do
//
//     final mainClass = mainClassFromJson(jsonString);

import 'dart:convert';

MainClass mainClassFromJson(String str) => MainClass.fromJson(json.decode(str));

String mainClassToJson(MainClass data) => json.encode(data.toJson());

class MainClass {
  MainClass({
    this.product,
    this.productLink,
    this.stockManagement,
    this.customizationControllerLink,
    this.quantityWarning,
    this.moduleBlockwishlist,
    this.moduleProductcomments,
  });

  Product product;
  String productLink;
  String stockManagement;
  String customizationControllerLink;
  String quantityWarning;
  String moduleBlockwishlist;
  String moduleProductcomments;

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
    product: Product.fromJson(json["product"]),
    productLink: json["product_link"],
    stockManagement: json["stock_management"],
    customizationControllerLink: json["customization_controller_link"],
    quantityWarning: json["quantity_warning"],
    moduleBlockwishlist: json["module_blockwishlist"],
    moduleProductcomments: json["module_productcomments"],
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
    "product_link": productLink,
    "stock_management": stockManagement,
    "customization_controller_link": customizationControllerLink,
    "quantity_warning": quantityWarning,
    "module_blockwishlist": moduleBlockwishlist,
    "module_productcomments": moduleProductcomments,
  };
}

class Product {
  Product({
    this.name,
    this.description,
    this.descriptionShort,
    this.quantity,
    this.price,
    this.reference,
    this.customizable,
    this.uploadableFiles,
    this.textFields,
    this.active,
    this.availableForOrder,
    this.condition,
    this.showPrice,
    this.advancedStockManagement,
    this.cacheIsPack,
    this.isVirtual,
    this.specificPrices,
    this.idProduct,
    this.reductionAmount,
    this.oldPrice,
    this.displayAddtocart,
    this.displayAvailabilityMessage,
    this.imageLinks,
  });

  String name;
  String description;
  String descriptionShort;
  String quantity;
  String price;
  Reference reference;
  String customizable;
  String uploadableFiles;
  String textFields;
  String active;
  String availableForOrder;
  String condition;
  String showPrice;
  String advancedStockManagement;
  String cacheIsPack;
  String isVirtual;
  SpecificPrices specificPrices;
  String idProduct;
  String reductionAmount;
  String oldPrice;
  String displayAddtocart;
  String displayAvailabilityMessage;
  ImageLinks imageLinks;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    description: json["description"],
    descriptionShort: json["description_short"],
    quantity: json["quantity"],
    price: json["price"],
    reference: Reference.fromJson(json["reference"]),
    customizable: json["customizable"],
    uploadableFiles: json["uploadable_files"],
    textFields: json["text_fields"],
    active: json["active"],
    availableForOrder: json["available_for_order"],
    condition: json["condition"],
    showPrice: json["show_price"],
    advancedStockManagement: json["advanced_stock_management"],
    cacheIsPack: json["cache_is_pack"],
    isVirtual: json["is_virtual"],
    specificPrices: SpecificPrices.fromJson(json["specific_prices"]),
    idProduct: json["id_product"],
    reductionAmount: json["reduction_amount"],
    oldPrice: json["old_price"],
    displayAddtocart: json["display_addtocart"],
    displayAvailabilityMessage: json["display_availability_message"],
    imageLinks: ImageLinks.fromJson(json["image_links"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "description_short": descriptionShort,
    "quantity": quantity,
    "price": price,
    "reference": reference.toJson(),
    "customizable": customizable,
    "uploadable_files": uploadableFiles,
    "text_fields": textFields,
    "active": active,
    "available_for_order": availableForOrder,
    "condition": condition,
    "show_price": showPrice,
    "advanced_stock_management": advancedStockManagement,
    "cache_is_pack": cacheIsPack,
    "is_virtual": isVirtual,
    "specific_prices": specificPrices.toJson(),
    "id_product": idProduct,
    "reduction_amount": reductionAmount,
    "old_price": oldPrice,
    "display_addtocart": displayAddtocart,
    "display_availability_message": displayAvailabilityMessage,
    "image_links": imageLinks.toJson(),
  };
}

class ImageLinks {
  ImageLinks({
    this.imageLink,
  });

  ImageLink imageLink;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    imageLink: ImageLink.fromJson(json["image_link"]),
  );

  Map<String, dynamic> toJson() => {
    "image_link": imageLink.toJson(),
  };
}

class ImageLink {
  ImageLink({
    this.large,
  });

  String large;

  factory ImageLink.fromJson(Map<String, dynamic> json) => ImageLink(
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "large": large,
  };
}

class Reference {
  Reference();

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
  );

  Map<String, dynamic> toJson() => {
  };
}

class SpecificPrices {
  SpecificPrices({
    this.price,
    this.reduction,
    this.reductionTax,
    this.reductionType,
  });

  String price;
  String reduction;
  String reductionTax;
  String reductionType;

  factory SpecificPrices.fromJson(Map<String, dynamic> json) => SpecificPrices(
    price: json["price"],
    reduction: json["reduction"],
    reductionTax: json["reduction_tax"],
    reductionType: json["reduction_type"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "reduction": reduction,
    "reduction_tax": reductionTax,
    "reduction_type": reductionType,
  };
}
