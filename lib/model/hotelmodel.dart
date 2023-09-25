// To parse this JSON data, do
//
//     final hotel = hotelFromJson(jsonString);

import 'dart:convert';

List<Hotel> hotelFromJson(String str) =>
    List<Hotel>.from(json.decode(str).map((x) => Hotel.fromJson(x)));

String hotelToJson(List<Hotel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hotel {
  Hotel({
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
    required this.cost,
    required this.created,
    required this.city,
  });

  int id;
  String image;
  String name;
  String phone;
  String cost;
  DateTime created;
  int city;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        phone: json["phone"],
        cost: json["cost"],
        created: DateTime.parse(json["created"]),
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "phone": phone,
        "cost": cost,
        "created": created.toIso8601String(),
        "city": city,
      };
}
