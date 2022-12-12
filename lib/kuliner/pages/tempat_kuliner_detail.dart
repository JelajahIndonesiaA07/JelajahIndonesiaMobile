import 'package:flutter/material.dart';
import 'package:jim/kuliner/pages/tempat_kuliner_page.dart';

import '../../activity/widgets/drawer.dart';
import '../models/kuliner_models.dart';
import '../services/tempat_kuliner_services.dart';
import 'package:jim/kuliner/models/base_response.dart';
// import 'package:intl/intl.dart';

class TempatKulinerDetailPage extends StatelessWidget {
  final BaseResponseTempatKuliner tempatKuliner;
  const TempatKulinerDetailPage({super.key, required this.tempatKuliner});

  @override
  Widget build(BuildContext context) {
    // String reviewText = Text("Review");
    final titleTempatKuliner = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          tempatKuliner.fields.namaTempatKuliner,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));

    final ratingTempatKulinerList = Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          const Text(
            "Rating: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(tempatKuliner.fields.ratingTempatKuliner,
              style: const TextStyle(fontSize: 20)
          ),
        ],
      ),
    );

    // final alamatTempatKulinerList = Padding(
    //   padding: const EdgeInsets.all(5.0),
    //   child: Row(
    //     children: [
    //       const Text(
    //         "Alamat: ",
    //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //       ),
    //       Text(
    //           tempatKuliner.alamat,
    //           style: const TextStyle(fontSize: 20)
    //       ),
    //     ],
    //   ),
    // );

    final lokasiTempatKuliner = Padding(
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
                    text: tempatKuliner.fields.lokasiTempatKuliner,
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
                                bool result = await TempatKulinerServices()
                                    .deleteTempatKuliner(
                                  tempatKulinerId: tempatKuliner.pk,
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
                                              const kulinerPage()),
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
          titleTempatKuliner,
          ratingTempatKulinerList,
          lokasiTempatKuliner,
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
