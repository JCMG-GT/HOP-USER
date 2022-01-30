import 'dart:convert';

FirstRegisterModel firstRegisterModelFromJson(String str) =>
    FirstRegisterModel.fromJson(json.decode(str));

String firstRegisterModelToJson(FirstRegisterModel data) =>
    json.encode(data.toJson());

class FirstRegisterModel {
  FirstRegisterModel({
    this.fullname,
    this.email,
    this.user,
    this.password,
  });

  String? fullname;
  String? email;
  String? user;
  String? password;

  factory FirstRegisterModel.fromJson(Map<String, dynamic> json) =>
      FirstRegisterModel(
        fullname: json["fullname"],
        email: json["email"],
        user: json["user"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "user": user,
        "password": password,
      };
}
