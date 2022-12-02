import 'package:jim/kuliner/models/budgetmodels.dart';
import 'package:jim/kuliner/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jim/kuliner/utils/globals.dart' as globals;

class TambahBudget extends StatefulWidget {
  const TambahBudget({super.key});

  @override
  State<TambahBudget> createState() => _TambahBudgetState();
}

class _TambahBudgetState extends State<TambahBudget> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _jenisItems = ['Pemasukkan', 'Pengeluaran'];
  String _judul = '';
  String _nominal = '';
  String _jenis = '';
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Budget'),
      ),
      drawer: const DrawerApp(
        route: 'tambah-budget',
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Judul',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ex. Sate Pacil',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Bagian ini tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Nominal',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ex. 17000',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _nominal = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _nominal = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Bagian ini tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Jenis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Pilih jenis',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: _jenisItems
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return '      Bagian ini tidak boleh kosong!';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      _jenis = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Tanggal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 7, left: 15, bottom: 7, right: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _dateTime != null
                                ? DateFormat('EEE, d MMMM yyyy')
                                    .format(_dateTime!)
                                : 'Pilih tanggal',
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.calendar_month,
                              size: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2099),
                              ).then(
                                (date) => setState(
                                  () => _dateTime = date,
                                ),
                              );
                            },
                          ),
                        ]),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Budget data = Budget(
                              _judul,
                              _nominal,
                              _jenis,
                              DateFormat('EEE, d MMMM yyyy').format(_dateTime!),
                            );
                            globals.budgets.add(data);
                          }
                        },
                        child: Text(
                          'Submit',
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}