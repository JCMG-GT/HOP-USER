import 'dart:convert';

GeneroModel generoModelFromJson(String str) =>
    GeneroModel.fromJson(json.decode(str));

String generoModelToJson(GeneroModel data) => json.encode(data.toJson());

class GeneroModel {
  GeneroModel({
    this.id,
    this.descripcion,
  });

  String? id;
  String? descripcion;

  factory GeneroModel.fromJson(Map<String, dynamic> json) => GeneroModel(
        id: json["id"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
      };
}
