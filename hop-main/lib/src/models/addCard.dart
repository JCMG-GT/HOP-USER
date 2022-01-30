import 'dart:convert';

CardPaymentModel cardPaymentModelFromJson(String str) =>
    CardPaymentModel.fromJson(json.decode(str));

String cardPaymentModelToJson(CardPaymentModel data) =>
    json.encode(data.toJson());

class CardPaymentModel {
  CardPaymentModel({
    this.name,
    this.card,
    this.expiration,
    this.cvv,
  });

  String? name;
  String? card;
  String? expiration;
  String? cvv;

  factory CardPaymentModel.fromJson(Map<String, dynamic> json) =>
      CardPaymentModel(
        name: json["name"],
        card: json["card"],
        expiration: json["expiration"],
        cvv: json["cvv"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "card": card,
        "expiration": expiration,
        "cvv": cvv,
      };
}
