import 'package:jim/emergencycall/fetch/fetchemergencycall.dart';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:jim/activity/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:jim/emergencycall/pages/emergencycalldetail.dart';
import 'package:jim/emergencycall/pages/postemergencycall.dart';

import '../../activity/widgets/drawer.dart';
import '../models/baseresponse.dart';
import '../fetch/fetchemergencycall.dart';

import 'package:jim/emergencycall/fetch/fetchemergencycall.dart';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:jim/emergencycall/pages/emergencycallpage.dart';

class EmergencyCallDetailPage extends StatelessWidget {
  final Emergencycall emergencycall;
  const EmergencyCallDetailPage({super.key, required this.emergencycall});

  @override
  Widget build(BuildContext context) {
    // String reviewText = Text("Review");
    final titleemergencycall = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          emergencycall.fields.hospitalName,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));

    final provinsiemergencycallList = Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          const Text(
            "Nomor Telepon: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text("0" + emergencycall.fields.hospitalNumber.toString(),
              style: const TextStyle(fontSize: 20)),
        ],
      ),
    );

    // final alamatemergencycallList = Padding(
    //   padding: const EdgeInsets.all(5.0),
    //   child: Row(
    //     children: [
    //       const Text(
    //         "Alamat: ",
    //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //       ),
    //       Text(
    //           emergencycall.alamat,
    //           style: const TextStyle(fontSize: 20)
    //       ),
    //     ],
    //   ),
    // );

    final deskripsiemergencycall = Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Flexible(
                child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Lokasi:\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: emergencycall.fields.hospitalLocation,
                  ),
                ],
              ),
            )),
          ],
        ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Ask"),
                        content: Text("Do you want to delete?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("NO")),
                          TextButton(
                              onPressed: () async {
                                bool result = await EmergencyCallServices()
                                    .deleteEmergencyCall(
                                  emergencycallId: emergencycall.pk,
                                );
                                if (result) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Berhasil hapus data")));
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EmergencyCallPage()),
                                      (Route<dynamic> route) => false);
                                }
                              },
                              child: Text("YES")),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const DrawerApp(),
      body: Column(
        children: <Widget>[
          titleemergencycall,
          provinsiemergencycallList,
          deskripsiemergencycall,
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
