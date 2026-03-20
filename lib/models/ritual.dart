import 'dart:convert';

class Ritual {
  String? id; // Para guardar el ID de Firebase (-Nxyz...)
  String body;
  String date;
  String description;
  String picture;
  String title;

  Ritual({
    this.id,
    required this.body,
    required this.description,
    required this.picture,
    required this.title,
    required this.date,
  });

  factory Ritual.fromRawJson(String str) => Ritual.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ritual.fromJson(Map<String, dynamic> json) => Ritual(
    body: json["body"] ?? '',
    description: json["description"] ?? '',
    picture: json["picture"] ?? '',
    title: json["title"] ?? '',
    date: json["date"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "body": body,
    "description": description,
    "picture": picture,
    "title": title,
    "date": date,
  };
}
