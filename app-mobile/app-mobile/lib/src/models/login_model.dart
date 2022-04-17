class LoginResponseModel {
  final dynamic username;
  final dynamic token;
  final dynamic status;
  final dynamic error;

  LoginResponseModel({this.username, this.token, this.status, this.error});

  static fromJson(json) {
    return LoginResponseModel(
      username: json['username'],
      token: json['token'],
      status: json['status'],
      error: json['error'],
    );
  }
}
