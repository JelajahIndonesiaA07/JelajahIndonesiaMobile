import 'package:flutter/material.dart';
import '../Profile_User/form.dart';
import '../Profile_User/summary.dart';
import 'package:jim/activity/widgets/drawer.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Profile'),
      ),
      drawer: const DrawerApp(),
      body: Container(
        child: ListView.builder(
            itemCount: ProfileForm.profile.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${ProfileForm.profile[index].nama}, ${ProfileForm.profile[index].umur}",
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\n\n\n Jenis Kelamin : ${ProfileForm.profile[index].gender}",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Status: ${ProfileForm.profile[index].vaksin == "Sudah" ? "Sudah ✅" : "Belum ❌"}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Asal Negara : ${ProfileForm.profile[index].negara}",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tujuan Kedatangan : ${ProfileForm.profile[index].tujuan}",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Provinsi Tujuan : ${ProfileForm.profile[index].prov}",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Kontak : ${ProfileForm.profile[index].kontak}",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),      
    );      
  }     
}     
      