import 'package:flutter/material.dart';
import 'package:jim/emergencycall/theme/theme_helper.dart';

import '../../activity/widgets/drawer.dart';
import '../models/base_response.dart';
import '../pages/tempat_kuliner_page.dart';
// import '../pages/widgets/header_widget.dart';
import '../services/tempat_kuliner_services.dart';

class TempatKulinerForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TempatKulinerFormState();
  }
}

class _TempatKulinerFormState extends State<TempatKulinerForm> {
  TextEditingController nama = TextEditingController();
  TextEditingController rating= TextEditingController();
  TextEditingController lokasi = TextEditingController();
  bool loading = false;

  _onLoading() => setState(() => loading = true);
  _offLoading() => setState(() => loading = false);

  Future<ResponseModel> _submitData() async {
    _onLoading();
    ResponseModel result = await TempatKulinerServices().addTempatKuliner(
        namaTempatKuliner: nama.text,
        ratingTempatKuliner: rating.text,
        lokasiTempatKuliner: lokasi.text);
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
              height: 150,
              // child: const HeaderWidget(
              //     150, false, Icons.person_add_alt_1_rounded),
            ),
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
                                'Nama Kuliner', 'Masukkan nama tempat Kuliner'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Nama Kuliner tidak boleh kosong";
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
                            controller: rating,
                            decoration: ThemeHelper().textInputDecoration(
                                'rating', 'Masukkan rating tempat Kuliner'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "rating tidak boleh kosong";
                              } else if (val.length > 10) {
                                return "rating maksimal 5";
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
                                'lokasi',
                                'Masukkan lokasi tempat Kuliner'),
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
                                if (res.msg == "nama Kuliner berhasil dibuat") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar( SnackBar(
                                      content: Text(
                                          res.msg)));
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const kulinerPage()),
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