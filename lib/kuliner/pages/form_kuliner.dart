import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jim/activity/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _TambahKulinerContentPageState();
}

class KulinerContent {
  late String nama_tempat_kuliner;
  late String rating_tempat_kuliner;
  late String lokasi_tempat_kuliner;

  KulinerContent({
    required this.nama_tempat_kuliner,
    required this.rating_tempat_kuliner,
    required this.lokasi_tempat_kuliner,
  });
}

class _TambahKulinerContentPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? nama_tempat_kuliner;
  String? rating_tempat_kuliner;
  String? lokasi_tempat_kuliner;
  Future<KulinerContent>? _futureAlbum;
  final TextEditingController _in = TextEditingController();
  final TextEditingController _in2 = TextEditingController();
  final TextEditingController _in3 = TextEditingController();

  void submit(String nama_tempat_kuliner, String rating_tempat_kuliner, String lokasi_tempat_kuliner) async {
    var url = Uri.parse(
        'https://jelajah-indonesia.up.railway.app/tempat_kuliner/add-tempat-kuliner-flutter/');
    var map = <String, dynamic>{};
    map["nama_tempat_kuliner"] = nama_tempat_kuliner;
    map["rating_tempat_kuliner"] = rating_tempat_kuliner;
    map["lokasi_tempat_kuliner"] = lokasi_tempat_kuliner;
    var response = await http.post(url, body: map);
    print(response.body);
    onPressed(BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Data sedang diproses. Mohon tunggu...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tempat Kuliner'),
      ),
      drawer: const DrawerApp(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _in,
                    decoration: InputDecoration(
                      hintText: "Contoh: Nasi Padang Bu Ane",
                      labelText: "Nama Tempat Kuliner",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.food_bank),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nama_tempat_kuliner = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        nama_tempat_kuliner = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Tempat Kuliner Masih Kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _in2,
                    decoration: InputDecoration(
                      hintText: "Contoh: 5",
                      labelText: "Rating Tempat Kuliner",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.star),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? rate) {
                      setState(() {
                        rating_tempat_kuliner = rate!;
                      });
                    },
                    onSaved: (String? rate) {
                      setState(() {
                        rating_tempat_kuliner = rate!;
                      });
                    },
                    validator: (String? rate) {
                      if (rate == null || rate.isEmpty) {
                        return 'Rating Tempat Kuliner Masih Kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _in3,
                    decoration: InputDecoration(
                      hintText: "Contoh: Jl. Kebon Sirih No.59, RT.8/RW.2, Kb. Sirih, Kec. Menteng, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10340",
                      labelText: "Lokasi Tempat Kuliner",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.location_city),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? loc) {
                      setState(() {
                        lokasi_tempat_kuliner = loc!;
                      });
                    },
                    onSaved: (String? loc) {
                      setState(() {
                        lokasi_tempat_kuliner = loc!;
                      });
                    },
                    validator: (String? loc) {
                      if (loc == null || loc.isEmpty) {
                        return 'Lokasi Tempat Kuliner Masih Kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.all(15.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submit(nama_tempat_kuliner!, rating_tempat_kuliner!, lokasi_tempat_kuliner!);
                        showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Container(
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Center(child: Text('Berhasil Menambahkan!')),
                                  const SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nama Tempat Kuliner: $nama_tempat_kuliner',
                                          style: TextStyle(color: Color.fromARGB(255, 196, 195, 199)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Rating Tempat Kuliner: $rating_tempat_kuliner',
                                          style: TextStyle(color: Color.fromARGB(255, 196, 195, 199)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Lokasi Tempat Kuliner: $lokasi_tempat_kuliner',
                                          style: TextStyle(color: Color.fromARGB(255, 196, 195, 199)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali',
                                      style: TextStyle(color: Color.fromARGB(255, 161, 22, 22))),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      }
                    },
                    child: const Text('Simpan',
                      style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}