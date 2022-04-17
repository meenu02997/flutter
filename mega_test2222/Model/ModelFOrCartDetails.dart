// To parse this JSON data, do
//
//     final modelForCartApi = modelForCartApiFromJson(jsonString);

import 'dart:convert';

ModelForCartApi modelForCartApiFromJson(String str) => ModelForCartApi.fromJson(json.decode(str));

String modelForCartApiToJson(ModelForCartApi data) => json.encode(data.toJson());

class ModelForCartApi {
  ModelForCartApi({
    this.success,
    this.responseCode,
    this.message,
    this.itemsPerPage,
    this.addons,
    this.customerId,
    this.userId,
    this.cartCount,
    this.wishlistCount,
    this.isEmailVerified,
    this.name,
    this.subtotal,
    this.tax,
    this.grandtotal,
    this.items,
  });

  bool success;
  int responseCode;
  String message;
  int itemsPerPage;
  Addons addons;
  int customerId;
  int userId;
  int cartCount;
  int wishlistCount;
  bool isEmailVerified;
  String name;
  Grandtotal subtotal;
  Grandtotal tax;
  Grandtotal grandtotal;
  List<Item> items;

  factory ModelForCartApi.fromJson(Map<String, dynamic> json) => ModelForCartApi(
    success: json["success"],
    responseCode: json["responseCode"],
    message: json["message"],
    itemsPerPage: json["itemsPerPage"],
    addons: Addons.fromJson(json["addons"]),
    customerId: json["customerId"],
    userId: json["userId"],
    cartCount: json["cartCount"],
    wishlistCount: json["WishlistCount"],
    isEmailVerified: json["is_email_verified"],
    name: json["name"],
    subtotal: Grandtotal.fromJson(json["subtotal"]),
    tax: Grandtotal.fromJson(json["tax"]),
    grandtotal: Grandtotal.fromJson(json["grandtotal"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "responseCode": responseCode,
    "message": message,
    "itemsPerPage": itemsPerPage,
    "addons": addons.toJson(),
    "customerId": customerId,
    "userId": userId,
    "cartCount": cartCount,
    "WishlistCount": wishlistCount,
    "is_email_verified": isEmailVerified,
    "name": name,
    "subtotal": subtotal.toJson(),
    "tax": tax.toJson(),
    "grandtotal": grandtotal.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Addons {
  Addons({
    this.wishlist,
    this.review,
    this.emailVerification,
    this.odooMarketplace,
    this.websiteSaleDelivery,
    this.odooGdpr,
  });

  bool wishlist;
  bool review;
  bool emailVerification;
  bool odooMarketplace;
  bool websiteSaleDelivery;
  bool odooGdpr;

  factory Addons.fromJson(Map<String, dynamic> json) => Addons(
    wishlist: json["wishlist"],
    review: json["review"],
    emailVerification: json["email_verification"],
    odooMarketplace: json["odoo_marketplace"],
    websiteSaleDelivery: json["website_sale_delivery"],
    odooGdpr: json["odoo_gdpr"],
  );

  Map<String, dynamic> toJson() => {
    "wishlist": wishlist,
    "review": review,
    "email_verification": emailVerification,
    "odoo_marketplace": odooMarketplace,
    "website_sale_delivery": websiteSaleDelivery,
    "odoo_gdpr": odooGdpr,
  };
}

class Grandtotal {
  Grandtotal({
    this.title,
    this.value,
  });

  String title;
  String value;

  factory Grandtotal.fromJson(Map<String, dynamic> json) => Grandtotal(
    title: json["title"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": value,
  };
}

class Item {
  Item({
    this.lineId,
    this.templateId,
    this.name,
    this.thumbNail,
    this.priceReduce,
    this.priceUnit,
    this.qty,
    this.total,
    this.discount,
  });

  int lineId;
  int templateId;
  String name;
  String thumbNail;
  String priceReduce;
  String priceUnit;
  double qty;
  String total;
  String discount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    lineId: json["lineId"],
    templateId: json["templateId"],
    name: json["name"],
    thumbNail: json["thumbNail"],
    priceReduce: json["priceReduce"],
    priceUnit: json["priceUnit"],
    qty: json["qty"],
    total: json["total"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "lineId": lineId,
    "templateId": templateId,
    "name": name,
    "thumbNail": thumbNail,
    "priceReduce": priceReduce,
    "priceUnit": priceUnit,
    "qty": qty,
    "total": total,
    "discount": discount,
  };
}
