class QRResponseModel {
  final dynamic type;
  final dynamic identifier;
  final dynamic price;
  final dynamic suffix;

  QRResponseModel({this.type, this.identifier, this.price, this.suffix});

  static fromJson(json) {
    return QRResponseModel(
      type: json['type'],
      identifier: json['identifier'],
      price: json['price'],
      suffix: json['suffix'],
    );
  }
}
