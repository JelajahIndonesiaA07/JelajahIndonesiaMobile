import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _TambahActivityContentPageState();
}

class ActivityContent {
  late String title;
  late String description;

  ActivityContent({
    required this.title,
    required this.description,
  });
}

class _TambahActivityContentPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;
  Future<ActivityContent>? _futureAlbum;
  final TextEditingController _in = TextEditingController();
  final TextEditingController _in2 = TextEditingController();

  void submit(String title, String description) async {
    var url = Uri.parse(
        'https://jelajah-indonesia.up.railway.app/activity/add-activity-flutter/');
    var map = <String, dynamic>{};
    map["title"] = title;
    map["description"] = description;
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
        title: const Text('Form ActivityContent'),
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
                  child: TextField(
                    controller: _in,
                    decoration: InputDecoration(
                      hintText: "Contoh: Dieng",
                      labelText: "Nama Tempat",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    // onSaved: (String? value) {
                    //   setState(() {
                    //     _title = value!;
                    //   });
                    // },
                    // // Validator sebagai validasi form
                    // validator: (String? value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'title tidak boleh kosong!';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _in2,
                    decoration: InputDecoration(
                      hintText: "Contoh: Berenang",
                      labelText: "Deskripsi Kegiatan",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? desc) {
                      setState(() {
                        description = desc!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    // onSaved: (String? desc) {
                    //   setState(() {
                    //     description = desc!;
                    //   });
                    // },
                    // Validator sebagai validasi form
                    // validator: (String? value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'title tidak boleh kosong!';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(15.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submit(title!, description!);
                      }
                    },
                    child: const Text("Simpan",
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