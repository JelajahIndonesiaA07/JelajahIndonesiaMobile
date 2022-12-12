// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Activity> activityFromJson(String str) =>
    List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BaseResponseActivity {
  BaseResponseActivity({
    required this.model,
    required this.pk,
    required this.fields,
  });

  final String model;
  final int pk;
  final Activity fields;

  factory BaseResponseActivity.fromJson(Map<String, dynamic> json) =>
      BaseResponseActivity(
        model: json["model"],
        pk: json["pk"],
        fields: Activity.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

// class Activity {
//   Activity({
//     required this.model,
//     required this.pk,
//     required this.fields,
//   });

//   String model;
//   int pk;
//   Fields fields;

//   factory Activity.fromJson(Map<String, dynamic> json) => Activity(
//         model: json["model"],
//         pk: json["pk"],
//         fields: Fields.fromJson(json["fields"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "model": model,
//         "pk": pk,
//         "fields": fields.toJson(),
//       };
// }

class Activity {
  Activity({
    required this.user,
    required this.title,
    required this.description,
  });

  final int user;
  final String title;
  final String description;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        user: json["user"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "description": description,
      };
}
