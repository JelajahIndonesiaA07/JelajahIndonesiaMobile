
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jim/common/theme_helper.dart';
import '../page/widgets/header_widget.dart';
import '../page/tempat_wisata_page.dart';
import '../drawer.dart';

class TempatWisataForm extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TempatWisataFormState();
  }
}

class _TempatWisataFormState extends State<TempatWisataForm>{

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              // Container(
                              //   padding: EdgeInsets.all(10),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(100),
                              //     border: Border.all(
                              //         width: 5, color: Colors.white),
                              //     color: Colors.white,
                              //     boxShadow: const [
                              //       BoxShadow(
                              //         color: Colors.black12,
                              //         blurRadius: 20,
                              //         offset: Offset(5, 5),
                              //       ),
                              //     ],
                              //   ),
                              //   child: Icon(
                              //     Icons.person,
                              //     color: Colors.grey.shade300,
                              //     size: 80.0,
                              //   ),
                              // ),
                              // Container(
                              //   padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                              //   child: Icon(
                              //     Icons.add_circle,
                              //     color: Colors.grey.shade700,
                              //     size: 25.0,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Nama Wisata', 'Masukkan nama tempat wisata'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Nama wisata tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Provinsi', 'Masukkan provinsi tempat wisata'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Provinsi idak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Deskripsi', 'Masukkan deskripsi tempat wisata'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Deskripsi tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => TempatWisataPage()
                                    ),
                                        (Route<dynamic> route) => false
                                );
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