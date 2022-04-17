class LoginApiModel {
  bool success;
  int responseCode;
  String message;
  int itemsPerPage;
  Addons addons;
  int customerId;
  int userId;
  bool isEmailVerified;
  String customerBannerImage;
  String customerProfileImage;
  String themeCode;
  String customerName;
  String customerEmail;


  LoginApiModel({this.itemsPerPage,this.success,this.responseCode, this.message, this.addons,this.customerId,this.userId,this.isEmailVerified,this.customerBannerImage,
    this.customerProfileImage,this.themeCode,this.customerName,this.customerEmail,});

  LoginApiModel.fromJson(Map<String, dynamic> Parsedjson) {
    success = Parsedjson['success'];
    responseCode = Parsedjson['responseCode'];
    message = Parsedjson['message'];
    itemsPerPage = Parsedjson['itemsPerPage'];
    addons = Parsedjson['addons'] != null ? new Addons.fromJson(Parsedjson['addons']) : null;
    customerId = Parsedjson['customerId'];
    userId = Parsedjson['userId'];
    isEmailVerified = Parsedjson['is_email_verified'];
    customerBannerImage = Parsedjson['customerBannerImage'];
    customerProfileImage = Parsedjson['customerProfileImage'];
    themeCode = Parsedjson['themeCode'];
    customerName = Parsedjson['customerName'];
    customerEmail = Parsedjson['customerEmail'];
  }
}

class Addons {
  bool wishlist;
  bool review;
  bool emailVerification;
  bool odooMarketplace;
  bool websiteSaleDelivery;
  bool odooGdpr;

  Addons({this.wishlist,this.review,this.emailVerification,this.odooMarketplace,this.websiteSaleDelivery,this.odooGdpr});

  Addons.fromJson(Map<String, dynamic> json) {
    wishlist = json['wishlist'];
    review = json['review'];
    emailVerification = json['email_verification'];
    odooMarketplace = json['odoo_marketplace'];
    websiteSaleDelivery = json['website_sale_delivery'];
    odooGdpr = json['odoo_gdpr'];
  }
}