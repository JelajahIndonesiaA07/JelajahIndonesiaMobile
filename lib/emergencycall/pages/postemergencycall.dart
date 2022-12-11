
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jim/activity/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHospitalFormPage extends StatefulWidget {
  const MyHospitalFormPage({super.key});

  @override
  State<MyHospitalFormPage> createState() => _TambahHospitalContentPageState();
}

class HospitalContent {
  late String hospital_name;
  late String hospital_number;
  late String hospital_location;

  HospitalContent({
    required this.hospital_name,
    required this.hospital_number,
    required this.hospital_location,
  });
}

class _TambahHospitalContentPageState extends State<MyHospitalFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? hospital_name;
  String? hospital_number;
  String? hospital_location;

  Future<HospitalContent>? _futureAlbum;
  final TextEditingController _in = TextEditingController();
  final TextEditingController _in2 = TextEditingController();
  final TextEditingController _in3 = TextEditingController();

  void submit(String hospital_name, String hospital_number,
      String hospital_location) async {
    var url = Uri.parse(
        'https://jelajah-indonesia.up.railway.app/emergencycall/add-emergencycall-flutter/');

    var map = <String, dynamic>{};

    map["hospital_name"] = hospital_name;
    map["hospital_number"] = (hospital_number);
    map["hospital_location"] = hospital_location;

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
        title: const Text('Tambah Rumah Sakit'),
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
                      hintText: "Contoh: Rumah Sakit Persahabatan",
                      labelText: "Nama Rumah Sakit",
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
                        hospital_name = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        hospital_name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Rumah Sakit Masih Kosong!';
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
                      hintText: "Contoh: 021999333",
                      labelText: "Nomor Telefon Rumah Sakit",
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
                        hospital_number = rate!;
                      });
                    },
                    onSaved: (String? rate) {
                      setState(() {
                        hospital_number = rate!;
                      });
                    },
                    validator: (String? rate) {
                      if (rate == null || rate.isEmpty) {
                        return 'Nomor Telefon Rumah Sakit Masih Kosong!';
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
                      hintText: "JL Kamojang IV",
                      labelText: "Lokasi Rumah Sakit",
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
                        hospital_location = loc!;
                      });
                    },
                    onSaved: (String? loc) {
                      setState(() {
                        hospital_location = loc!;
                      });
                    },
                    validator: (String? loc) {
                      if (loc == null || loc.isEmpty) {
                        return 'Lokasi Rumah Sakit Masih Kosong!';
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
                        submit(hospital_name!, hospital_number!, hospital_location!);
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
                                          'Nama Rumah Sakit: $hospital_name',
                                          style: TextStyle(color: Colors.deepPurple),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Nomor Telefon Rumah Sakit: $hospital_number',
                                          style: TextStyle(color: Colors.deepPurple),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Lokasi Rumah Sakit: $hospital_location',
                                          style: TextStyle(color: Colors.deepPurple),
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
                                    child: const Text('Kembali'),
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