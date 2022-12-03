class TempatWisata {
  String provinsi;
  String nama_wisata;
  String deskripsi;

  TempatWisata(
      {required this.provinsi,
        required this.nama_wisata,
        required this.deskripsi});

  factory TempatWisata.fromJson(Map<String, dynamic> json) => TempatWisata(
      provinsi: json["fields"]["provinsi_tempat_wisata"],
      nama_wisata: json["fields"]["nama_tempat_wisata"],
      deskripsi: json["fields"]["deskripsi_tempat_wisata"]);

  Map<String, dynamic> toJson() => {
    "title": nama_wisata,
  };
}