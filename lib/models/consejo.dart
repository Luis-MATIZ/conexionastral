import 'dart:convert';

class Consejo {
  String? id; // Para guardar el ID de Firebase (-Nxyz...)
  String body;
  String date;
  String description;
  String picture;
  String title;

  Consejo({
    this.id,
    required this.body,
    required this.description,
    required this.picture,
    required this.title,
    required this.date,
  });

  factory Consejo.fromRawJson(String str) => Consejo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Consejo.fromJson(Map<String, dynamic> json) => Consejo(
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
