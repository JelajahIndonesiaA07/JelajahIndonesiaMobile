class TempatWisata {
  String nama_kota;
  String nama_wisata;
  String alamat;
  String deskripsi;

  TempatWisata(
      {required this.nama_kota,
        required this.nama_wisata,
        required this.alamat,
        required this.deskripsi});

  factory TempatWisata.fromJson(Map<String, dynamic> json) => TempatWisata(
      nama_kota: json["fields"]["nama_kota"],
      nama_wisata: json["fields"]["nama_wisata"],
      alamat: json["fields"]["alamat"],
      deskripsi: json["fields"]["deskripsi"]);

  Map<String, dynamic> toJson() => {
    "title": nama_wisata,
  };
}