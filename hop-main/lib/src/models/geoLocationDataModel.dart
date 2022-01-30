import 'dart:convert';

// Generated by https://quicktype.io

class GeoLocationData {
  String? amigos;
  String? google;
  String? lat;
  String? name;
  String? lng;
  String? placeId;

  GeoLocationData({
    this.amigos,
    this.google,
    this.lat,
    this.name,
    this.lng,
    this.placeId,
  });

  Map<String, dynamic> toMap() {
    return {
      "amigos": amigos,
      "google": google,
      "lat": lat,
      "name": name,
      "lng": lng,
      "place_id": placeId,
    };
  }

  factory GeoLocationData.fromMap(Map<String, dynamic> map) {
    return GeoLocationData(
      amigos: map['amigos'],
      google: map['google'],
      lat: map['lat'],
      name: map['name'],
      lng: map['lng'],
      placeId: map['place_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoLocationData.fromJson(String source) =>
      GeoLocationData.fromMap(json.decode(source));
}
