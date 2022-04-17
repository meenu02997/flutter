class ProductListApiModel{
bool success;
int responseCode;
String message;
int itemsPerPage;
int customerId;
int userId;
int cartCount;
int wishlistCount;
bool isEmailVerified;
List<dynamic> wishlist;
int tcount;
int offset;
List<Products> products;

ProductListApiModel({this.success,this.responseCode,this.message,this.itemsPerPage,this.customerId,this.isEmailVerified,this.userId,this.offset,
  this.products,this.cartCount,this.tcount,this.wishlist,this.wishlistCount});

ProductListApiModel.fromJson(Map<String, dynamic>ParsedJson){
  success = ParsedJson['success'];
  responseCode = ParsedJson['responseCode'];
  message = ParsedJson['message'];
  itemsPerPage = ParsedJson['itemsPerPage'];

  customerId = ParsedJson['customerId'];
  userId = ParsedJson['userId'];
  cartCount = ParsedJson['cartCount'];
  wishlistCount = ParsedJson['WishlistCount'];
  isEmailVerified = ParsedJson['is_email_verified'];

  tcount = ParsedJson['tcount'];
  offset = ParsedJson['offset'];
  if (ParsedJson['products'] != null) {
    products = new List<Products>();
    ParsedJson['products'].forEach((v) {products.add(new Products.fromJson(v));
       }
     );
    }
  }
}

class Products {
  int templateId;
  String name;
  String priceUnit;
  String priceReduce;
  int productId;
  int productCount;
  String description;
  String thumbNail;

  Products({this.templateId, this.name, this.priceUnit, this.priceReduce, this.productId, this.productCount, this.description, this.thumbNail});

  Products.fromJson(Map<String, dynamic> json) {
    templateId = json['templateId'];
    name = json['name'];
    priceUnit = json['priceUnit'];
    priceReduce = json['priceReduce'];
    productId = json['productId'];
    productCount = json['productCount'];
    description = json['description'];
    thumbNail = json['thumbNail'];
  }
}