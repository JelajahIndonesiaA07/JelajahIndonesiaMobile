import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import 'package:intl/intl.dart';
import '../models/all.dart' as globals;

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _TambahBudgetPageState();
}


class Budget {
  late String judul;
  late int nominal;
  late String jenisBudget;
  late DateTime date;

  Budget(
      {required this.judul,
      required this.nominal,
      required this.jenisBudget,
      required this.date});
}

class _TambahBudgetPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _judul;
  int? nominal;
  String? jenisBudget;
  List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];
  DateTime date = DateTime.now();

  onPressed(BuildContext context) {
    var data = Budget(
        judul: _judul!,
        nominal: nominal!,
        jenisBudget: jenisBudget!,
        date: date);
    globals.budgets.add(data);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data sedang diproses. Mohon tunggu...')));
  }

  @override
  Widget build(BuildContext context) {
    String datetime =
        DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(date);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
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
                    decoration: InputDecoration(
                      hintText: "Contoh: Sushi",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 200000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value != '') {
                          nominal = int.parse(value!);
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (value != '') {
                          nominal = int.parse(value!);
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: Text(datetime),
                  // make date to center
                  trailing: const Icon(Icons.keyboard_arrow_down),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != date) {
                      return setState(() {
                        date = picked;
                      });
                    }
                  },
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: jenisBudget,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: listJenisBudget.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenisBudget = newValue!;
                      });
                    },
                    hint: const SizedBox(
                      width: 150, //and here
                      child: Text(
                        "Pilih Jenis",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
                        if (jenisBudget == null || jenisBudget == '') {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(
                                        child: Text(
                                            'Pilih Jenis tidak boleh kosong')),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Kembali'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          onPressed(context);
                        }
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
