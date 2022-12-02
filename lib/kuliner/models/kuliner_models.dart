import 'package:meta/meta.dart';
import 'dart:convert';

List<Kuliner> kulinerFromJson(String str) =>
    List<Kuliner>.from(
        json.decode(str).map((x) => Kuliner.fromJson(x)));

String kulinerToJson(List<Kuliner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kuliner {
  Kuliner({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory Kuliner.fromJson(Map<String, dynamic> json) => Kuliner(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  String get review => null;

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.namaTempat,
    required this.rating,
    required this.alamat,
  });

  int user;
  String namaTempat;
  int rating;
  String alamat;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        namaTempat: json["nama_tempat_kuliner"],
        rating: json["rating_tempat_kuliner"],
        alamat: json["lokasi_tempat_kuliner"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "nama_tempat_kuliner": namaTempat,
        "rating_tempat_kuliner": rating,
        "lokasi_tempat_kuliner": alamat,
      };
}

enum Model { KULINER_KULINERITEM }

final modelValues = EnumValues(
    {"kuliner.kulineritem": Model.KULINER_KULINERITEM});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}