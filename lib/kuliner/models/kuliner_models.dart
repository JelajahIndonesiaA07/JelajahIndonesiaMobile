// To parse this JSON data, do
//
//     final kuliner = kulinerFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Kuliner> kulinerFromJson(String str) => List<Kuliner>.from(json.decode(str).map((x) => Kuliner.fromJson(x)));

String kulinerToJson(List<Kuliner> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.namaTempatKuliner,
        required this.ratingTempatKuliner,
        required this.lokasiTempatKuliner,
    });

    int user;
    String namaTempatKuliner;
    String ratingTempatKuliner;
    String lokasiTempatKuliner;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        namaTempatKuliner: json["nama_tempat_kuliner"],
        ratingTempatKuliner: json["rating_tempat_kuliner"],
        lokasiTempatKuliner: json["lokasi_tempat_kuliner"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "nama_tempat_kuliner": namaTempatKuliner,
        "rating_tempat_kuliner": ratingTempatKuliner,
        "lokasi_tempat_kuliner": lokasiTempatKuliner,
    };
}

enum Model { TEMPAT_KULINER_TEMPAT_KULINER_ITEM }

final modelValues = EnumValues({
    "tempat_kuliner.tempat_kuliner_item": Model.TEMPAT_KULINER_TEMPAT_KULINER_ITEM
});

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
