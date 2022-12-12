import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../function/fetch.dart';
import '../models/activity.dart';
import '../models/base.dart';

class MyActivityPage extends StatefulWidget {
  const MyActivityPage({super.key});

  @override
  State<MyActivityPage> createState() => _TambahActivityContentPageState();
}

class ActivityContent {
  late String title;
  late String description;

  ActivityContent({
    required this.title,
    required this.description,
  });
}

class _TambahActivityContentPageState extends State<MyActivityPage> {
  final _formKey = GlobalKey<FormState>();
  // String? title;
  // String? description;
  Future<ActivityContent>? _futureAlbum;
  final TextEditingController _in = TextEditingController();
  final TextEditingController _in2 = TextEditingController();
  String? title;
  String? description; 

  // void submit(String title, String description) async {
  //   var url = Uri.parse(
  //       'https://jelajah-indonesia.up.railway.app/activity/add-activity-flutter/');
  //   var map = <String, dynamic>{};
  //   map["title"] = title;
  //   map["description"] = description;
  //   var response = await http.post(url, body: map);
  //   print(response.body);
  //   onPressed(BuildContext context) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Data sedang diproses. Mohon tunggu...')));
  //   }
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Form ActivityContent'),
//       ),
//       drawer: const DrawerApp(),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Padding(
//                   // Menggunakan padding sebesar 8 pixels
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     controller: _in,
//                     decoration: InputDecoration(
//                       hintText: "Contoh: Dieng",
//                       labelText: "Nama Tempat",
//                       // Menambahkan circular border agar lebih rapi
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                     ),
//                     // Menambahkan behavior saat nama diketik
//                     onChanged: (String? value) {
//                       setState(() {
//                         title = value!;
//                       });
//                     },
//                     // Menambahkan behavior saat data disimpan
//                     // onSaved: (String? value) {
//                     //   setState(() {
//                     //     _title = value!;
//                     //   });
//                     // },
//                     // // Validator sebagai validasi form
//                     // validator: (String? value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'title tidak boleh kosong!';
//                     //   }
//                     //   return null;
//                     // },
//                   ),
//                 ),
//                 Padding(
//                   // Menggunakan padding sebesar 8 pixels
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     controller: _in2,
//                     decoration: InputDecoration(
//                       hintText: "Contoh: Berenang",
//                       labelText: "Deskripsi Kegiatan",
//                       // Menambahkan circular border agar lebih rapi
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                     ),
//                     // Menambahkan behavior saat nama diketik
//                     onChanged: (String? desc) {
//                       setState(() {
//                         description = desc!;
//                       });
//                     },
//                     // Menambahkan behavior saat data disimpan
//                     // onSaved: (String? desc) {
//                     //   setState(() {
//                     //     description = desc!;
//                     //   });
//                     // },
//                     // Validator sebagai validasi form
//                     // validator: (String? value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'title tidak boleh kosong!';
//                     //   }
//                     //   return null;
//                     // },
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: const EdgeInsets.all(15.0),
//                         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                         alignment: Alignment.center),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         submit(title!, description!);
//                       }
//                     },
//                     child: const Text("Simpan",
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
  bool loading = false;
  _onLoading() => setState(() => loading = true);
  _offLoading() => setState(() => loading = false);

  Future<ResponseModel> _submitData() async {
    _onLoading();
    ResponseModel result = await ActivityServices()
        .addActivity(title: _in.text, description: _in2.text);
    _offLoading();
    return result;
  }

  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Things To Do'),
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
                      hintText: "Contoh: Dieng",
                      labelText: "Nama Tempat",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.attractions),
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
                    onSaved: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },

                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'title tidak boleh kosong!';
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
                      hintText: "Contoh: Berenang",
                      labelText: "Deskripsi Kegiatan",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.surfing),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? rate) {
                      setState(() {
                        description = rate!;
                      });
                    },
                    onSaved: (String? rate) {
                      setState(() {
                        description = rate!;
                      });
                    },
                    validator: (String? rate) {
                      if (rate == null || rate.isEmpty) {
                        return 'Kegiatan Masih Kosong!';
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ResponseModel res = await _submitData();
                        if (res.msg == "nama activity berhasil dibuat") {
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
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const Center(
                                          child: Text('Berhasil Menambahkan!')),
                                      const SizedBox(height: 20),
                                      
                                      Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nama Tempat Kuliner: $title',
                                              style: TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Rating Tempat Kuliner: $description',
                                              style: TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                            const SizedBox(
                                              height: 10,
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
                        ;
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
