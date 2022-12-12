// To parse this JSON data, do
//
//     final emergencycall = emergencycallFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Emergencycall> emergencycallFromJson(String str) =>
    List<Emergencycall>.from(
        json.decode(str).map((x) => Emergencycall.fromJson(x)));

String emergencycallToJson(List<Emergencycall> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Emergencycall {
  Emergencycall({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory Emergencycall.fromJson(Map<String, dynamic> json) => Emergencycall(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.hospitalName,
    required this.hospitalNumber,
    required this.hospitalLocation,
  });

  int? user;
  String hospitalName;
  int hospitalNumber;
  String hospitalLocation;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        hospitalName: json["hospital_name"],
        hospitalNumber: json["hospital_number"],
        hospitalLocation: json["hospital_location"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user,
        "hospital_name": hospitalName,
        "hospital_number": hospitalNumber,
        "hospital_location": hospitalLocation,
      };
}

enum Model { EMERGENCYCALL_EMERGENCYCALLITEM }

final modelValues = EnumValues(
    {"emergencycall.emergencycallitem": Model.EMERGENCYCALL_EMERGENCYCALLITEM});

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
