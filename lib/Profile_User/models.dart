import 'dart:convert';

List<Profile> profileFromJson(String str) =>
    List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
  Profile({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    required this.nama,
    required this.umur,
    required this.gender,
    required this.vaksin,
    required this.negara,
    required this.tujuan,
    required this.prov,
    required this.kontak,
  });

  String nama;
  int umur;
  String gender;
  String vaksin;
  String negara;
  String tujuan;
  String prov;
  int kontak;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        nama: json["nama"],
        umur: json["umur"],
        gender: json["gender"],
        vaksin: json["vaksin"],
        negara: json["negara"],
        tujuan: json["tujuan"],
        prov: json["prov"],
        kontak: json["kontak"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "umur": umur,
        "gender": gender,
        "vaksin": vaksin,
        "negara": negara,
        "tujuan": tujuan,
        "prov": prov,
        "kontak": kontak,
      };
}

enum Model { PROFILE_USER }

final modelValues =
    EnumValues({"kuisioner_data_user.kuisioner": Model.PROFILE_USER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
