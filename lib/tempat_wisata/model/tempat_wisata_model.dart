

class BaseResponseTempatWisata {
  BaseResponseTempatWisata({
    required this.model,
    required this.pk,
    required this.fields,
  });

  final String model;
  final int pk;
  final TempatWisata fields;

  factory BaseResponseTempatWisata.fromJson(Map<String, dynamic> json) => BaseResponseTempatWisata(
    model: json["model"],
    pk: json["pk"],
    fields: TempatWisata.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class TempatWisata {
  TempatWisata({
    required this.user,
    required this.namaTempatWisata,
    required this.provinsiTempatWisata,
    required this.deskripsiTempatWisata,
  });

  final int user;
  final String namaTempatWisata;
  final String provinsiTempatWisata;
  final String deskripsiTempatWisata;

  factory TempatWisata.fromJson(Map<String, dynamic> json) => TempatWisata(
    user: json["user"],
    namaTempatWisata: json["nama_tempat_wisata"],
    provinsiTempatWisata: json["provinsi_tempat_wisata"],
    deskripsiTempatWisata: json["deskripsi_tempat_wisata"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "nama_tempat_wisata": namaTempatWisata,
    "provinsi_tempat_wisata": provinsiTempatWisata,
    "deskripsi_tempat_wisata": deskripsiTempatWisata,
  };
}
