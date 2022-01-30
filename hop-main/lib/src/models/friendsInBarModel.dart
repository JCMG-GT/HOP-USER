import 'dart:convert';

FriendsInBarModel barFavoriteFromJson(String str) =>
    FriendsInBarModel.fromJson(json.decode(str));

String friendsInBarModelToJson(FriendsInBarModel data) =>
    json.encode(data.toJson());

class FriendsInBarModel {
  FriendsInBarModel({this.id, this.nombre, this.url});

  String? id;
  String? nombre;
  String? url;

  factory FriendsInBarModel.fromJson(Map<String, dynamic> json) =>
      FriendsInBarModel(
          id: json["id"], nombre: json["nombre"], url: json["url"]);

  Map<String, dynamic> toJson() => {"id": id, "nombre": nombre, "url": url};
}
