import 'dart:convert';

SecundRegisterModel secundRegisterModelFromJson(String str) =>
    SecundRegisterModel.fromJson(json.decode(str));

String secundRegisterModelToJson(SecundRegisterModel data) =>
    json.encode(data.toJson());

class SecundRegisterModel {
  SecundRegisterModel({
    this.birthday,
    this.phone,
    this.gender,
  });

  String? birthday;
  String? phone;
  String? gender;

  factory SecundRegisterModel.fromJson(Map<String, dynamic> json) =>
      SecundRegisterModel(
        birthday: json["birthday"],
        phone: json["phone"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "birthday": birthday,
        "phone": phone,
        "gender": gender,
      };
}
