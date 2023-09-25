// To parse this JSON data, do
//
//     final reserevepacakge = reserevepacakgeFromJson(jsonString);

import 'dart:convert';

List<Reserevepacakge> reserevepacakgeFromJson(String str) =>
    List<Reserevepacakge>.from(
        json.decode(str).map((x) => Reserevepacakge.fromJson(x)));

String reserevepacakgeToJson(List<Reserevepacakge> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reserevepacakge {
  Reserevepacakge({
    required this.tourist,
    required this.email,
    required this.phone,
    required this.checkin,
    required this.checkout,
    required this.package,
  });

  String tourist;
  String email;
  String phone;
  DateTime checkin;
  DateTime checkout;
  int package;

  factory Reserevepacakge.fromJson(Map<String, dynamic> json) =>
      Reserevepacakge(
        tourist: json["tourist"],
        email: json["email"],
        phone: json["phone"],
        checkin: DateTime.parse(json["checkin"]),
        checkout: DateTime.parse(json["checkout"]),
        package: json["package"],
      );

  Map<String, dynamic> toJson() => {
        "tourist": tourist,
        "email": email,
        "phone": phone,
        "checkin": checkin.toIso8601String(),
        "checkout": checkout.toIso8601String(),
        "package": package,
      };
}
