import 'package:flutter/material.dart';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:jim/emergencycall/pages/emergencycalldetail.dart';
import 'package:jim/emergencycall/pages/postemergencycall.dart';

import '../../activity/widgets/drawer.dart';
import '../models/baseresponse.dart';
import '../fetch/fetchemergencycall.dart';

import 'package:jim/emergencycall/fetch/fetchemergencycall.dart';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:jim/emergencycall/pages/postemergencycall.dart';


class EmergencyCallPage extends StatefulWidget {
  const EmergencyCallPage({super.key});

  @override
  State<EmergencyCallPage> createState() => _EmergencyCallPageState();
}

class _EmergencyCallPageState extends State<EmergencyCallPage> {
  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Emergencycall emergencycall) => ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        child: const Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        emergencycall.fields.hospitalName,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EmergencyCallDetailPage(emergencycall: emergencycall)));
      },
    );

    Card makeCard(Emergencycall emergencycall) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.lightBlueAccent.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        child: makeListTile(emergencycall),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Rumah Sakit'),
      ),
      drawer: const DrawerApp(),
      body: FutureBuilder<ResponseModel>(
          future: EmergencyCallServices().getDataEmergencyCallByUserId(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                ResponseModel data = snapshot.data;

                if (data.data.isNotEmpty) {
                  return ListView.builder(
                      itemCount: data.data.length,
                      itemBuilder: (_, index) =>
                          makeCard(data.data[index]));
                } else {
                  return const Center(
                    child:
                    Text(
                      "Tidak ada Rumah Sakit",
                      style:
                      TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                  );
                }
              } else {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada Rumah Sakit",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              }
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyCallForm()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}