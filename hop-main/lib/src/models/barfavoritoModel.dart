import 'dart:convert';

BarFavorite barFavoriteFromJson(String str) =>
    BarFavorite.fromJson(json.decode(str));

String barFavoriteToJson(BarFavorite data) => json.encode(data.toJson());

class BarFavorite {
  BarFavorite({
    this.id,
    this.nombre,
    this.url,
    this.megusta,
  });

  String? id;
  String? nombre;
  String? url;
  String? megusta;

  factory BarFavorite.fromJson(Map<String, dynamic> json) => BarFavorite(
        id: json["id"],
        nombre: json["nombre"],
        url: json["url"],
        megusta: json["megusta"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "url": url,
        "megusta": megusta,
      };
}
