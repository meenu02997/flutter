// To parse this JSON data, do
//
//     final modelForDeleteApi = modelForDeleteApiFromJson(jsonString);

import 'dart:convert';

ModelForDeleteApi modelForDeleteApiFromJson(String str) => ModelForDeleteApi.fromJson(json.decode(str));

String modelForDeleteApiToJson(ModelForDeleteApi data) => json.encode(data.toJson());

class ModelForDeleteApi {
  ModelForDeleteApi({
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

  factory ModelForDeleteApi.fromJson(Map<String, dynamic> json) => ModelForDeleteApi(
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
