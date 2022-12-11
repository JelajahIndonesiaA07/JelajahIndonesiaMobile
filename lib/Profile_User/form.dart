// import 'package:counter_7/pages/watch.dart';
import 'package:flutter/material.dart';
import 'package:jim/Profile_User/profile.dart';
import 'package:jim/Profile_User/summary.dart';
import 'package:jim/activity/widgets/drawer.dart';
import '../main.dart';
// import 'package:counter_7/main.dart';
// import 'package:counter_7/pages/show.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class ProfileForm {
  String nama;
  int umur;
  String gender;
  String vaksin;
  String negara;
  String tujuan;
  String prov;
  int kontak;
  static List<ProfileForm> profile = [];

  ProfileForm(
    String this.nama,
    int this.umur,
    String this.gender,
    String this.vaksin,
    String this.negara,
    String this.tujuan,
    String this.prov,
    int this.kontak,
  );
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _nama = "";
  int _umur = 0;
  String? _gender;
  List<String> _genderList = ['Laki-Laki', 'Perempuan'];
  String? _vaksin;
  List<String> _vaksinList = ['Sudah', 'Belum'];
  String _negara = "";
  List<String> _negaraList = [""];
  String? _tujuan;
  List<String> _tujuanList = [
    "Perwakilan G20",
    "Pekerjaan/Bisnis",
    "Travelling",
    "Diplomasi",
    "Pendidikan"
  ];
  String? _prov;
  List<String> _provList = [
    "DKI Jakarta", 
    "Daerah Istimewa Yogyakarta", 
    "Jawa Barat", 
    "Jawa Tengah", 
    "Jawa Timur"];
  int _kontak = 0;

  bool _isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Profile'),
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nama",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nama = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nama = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Umur",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (_isNumeric(value)) {
                          _umur = int.parse(value!);
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (_isNumeric(value)) {
                          _umur = int.parse(value!);
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Umur tidak boleh kosong!';
                      } else if (!_isNumeric(value)) {
                        return 'Umur harus berupa angka';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    hint: const Text("Jenis Kelamin"),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    value: _gender,
                    items: _genderList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _gender = newValue!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Pilih Jenis Kelamin!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    hint: const Text("Tipe Vaksinasi"),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    value: _vaksin,
                    items: _vaksinList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _vaksin = newValue!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Pilih Tipe Vaksinasi!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Negara Asal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _negara = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _negara = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Negara Asal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    hint: const Text("Tujuan Kedatangan"),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    value: _tujuan,
                    items: _tujuanList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _tujuan = newValue!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Pilih Tujuan Kedatangan!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    hint: const Text("Provinsi Tujuan"),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    value: _prov,
                    items: _provList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _prov = newValue!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Pilih Provinsi Tujuan!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Kontak",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (_isNumeric(value)) {
                          _kontak = int.parse(value!);
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (_isNumeric(value)) {
                          _kontak = int.parse(value!);
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Kontak tidak boleh kosong!';
                      } else if (!_isNumeric(value)) {
                        return 'Kontak harus berupa angka';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ProfileForm newProfile = ProfileForm(_nama, _umur, _gender!,
                            _vaksin!, _negara, _tujuan!, _prov!, _kontak);
                        ProfileForm.profile.add(newProfile);
                        _formKey.currentState?.reset();
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
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
