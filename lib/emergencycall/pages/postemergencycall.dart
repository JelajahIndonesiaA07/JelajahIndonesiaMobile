
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jim/activity/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:jim/emergencycall/pages/emergencycalldetail.dart';
import 'package:jim/emergencycall/pages/emergencycallpage.dart';
import 'package:jim/emergencycall/pages/postemergencycall.dart';

import '../../activity/widgets/drawer.dart';
import '../models/baseresponse.dart';
import '../fetch/fetchemergencycall.dart';

import 'package:jim/emergencycall/fetch/fetchemergencycall.dart';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:jim/emergencycall/theme/theme_helper.dart';


class EmergencyCallForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmergencyCallFormState();
  }
}

class _EmergencyCallFormState extends State<EmergencyCallForm> {
  TextEditingController nama = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController lokasi = TextEditingController();
  bool loading = false;

  _onLoading() => setState(() => loading = true);
  _offLoading() => setState(() => loading = false);

  Future<ResponseModel> _submitData() async {
    _onLoading();
    ResponseModel result = await EmergencyCallServices().addEmergencyCall(
        hospital_name: nama.text,
        hospital_number: telefon.text,
        hospital_location: lokasi.text);
    _offLoading();
    return result;
  }

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: const [
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: nama,
                            decoration: ThemeHelper().textInputDecoration(
                                'Nama Rumah Sakit', 'Masukkan nama Rumah Sakit'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Nama Rumah Sakit tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: telefon,
                            decoration: ThemeHelper().textInputDecoration(
                                'Nomor Telefon', 'Masukkan nomor telefon Rumah Sakit'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Nomor Telefon tidak boleh kosong";
                              } else if (val.length > 20) {
                                return "maksimal input 20 characters";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: lokasi,
                            decoration: ThemeHelper().textInputDecoration(
                                'lokasi Rumah Sakit',
                                'Masukkan lokasi'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "lokasi tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        loading
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            : Container(
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: const Padding(
                              padding:
                              EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ResponseModel res = await _submitData();
                                if (res.msg == "Rumah Sakit berhasil ditambah") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar( SnackBar(
                                      content: Text(
                                          res.msg)));
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const EmergencyCallPage()),
                                          (Route<dynamic> route) => false);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar( SnackBar(
                                      content: Text(
                                          res.msg)));
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}