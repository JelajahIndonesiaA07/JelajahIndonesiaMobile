import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jim/Profile_User/form.dart';
import 'package:jim/Profile_User/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:jim/Profile_User/profile.dart';
import 'package:jim/Profile_User/summary.dart';
import 'package:jim/activity/widgets/drawer.dart';

import '../main.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.modelProfile});
  final Fields modelProfile;

  @override
  State<DetailPage> createState() => _DetailPageState(modelProfile);
}

class _DetailPageState extends State<DetailPage> {
  Fields model;
  _DetailPageState(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const DrawerApp(),
      body: Container(
        child: Stack(children: [
          Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),

                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 165, 224, 167),
                  ), 
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${model.nama}, ${model.umur}",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\n\n\n Jenis Kelamin : ${model.gender}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Status: ${model.vaksin == "Sudah" ? "Sudah ✅" : "Belum ❌"}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Asal Negara : ${model.negara}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tujuan Kedatangan : ${model.tujuan}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Provinsi Tujuan : ${model.prov}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Kontak : ${model.kontak}",
                ),
              ),
              ]),
              ),  
              ),
              Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor:
                              Colors.blue,
                          minimumSize: const Size.fromHeight(40.0),
                      ),
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ),
    );
  }
}
