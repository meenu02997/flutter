class AddtoCartApiModel{
  bool success;
  int responseCode;
  String message;
  int itemPerPage;
  int cartCount;
  int customerId;
  String productName;
  int userId;


  AddtoCartApiModel({this.success,this.cartCount,this.message,this.responseCode,
    this.itemPerPage,this.productName,this.customerId,this.userId});

  AddtoCartApiModel.fromJson(Map<String,dynamic>parsedJson){
    success = parsedJson['success'];
    message = parsedJson['message'];
    responseCode = parsedJson['responseCode'];
    itemPerPage = parsedJson['itemPerPage'];
    customerId= parsedJson["customerId"];
    userId= parsedJson["userId"];
    cartCount= parsedJson["cartCount"];
    productName= parsedJson["productName"];

  }
}