import 'package:flutter/material.dart';
import 'package:jim/tempat_wisata/page/tempat_wisata_page.dart';

import '../../activity/widgets/drawer.dart';
import '../model/tempat_wisata_model.dart';
import '../services/tempat_wisata_services.dart';
// import 'package:intl/intl.dart';

class TempatWisataDetailPage extends StatelessWidget {
  final BaseResponseTempatWisata tempatWisata;
  const TempatWisataDetailPage({super.key, required this.tempatWisata});

  @override
  Widget build(BuildContext context) {
    // String reviewText = Text("Review");
    final titleTempatWisata = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          tempatWisata.fields.namaTempatWisata,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));

    final provinsiTempatWisataList = Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          const Text(
            "Provinsi: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(tempatWisata.fields.provinsiTempatWisata,
              style: const TextStyle(fontSize: 20)),
        ],
      ),
    );

    // final alamatTempatWisataList = Padding(
    //   padding: const EdgeInsets.all(5.0),
    //   child: Row(
    //     children: [
    //       const Text(
    //         "Alamat: ",
    //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //       ),
    //       Text(
    //           tempatWisata.alamat,
    //           style: const TextStyle(fontSize: 20)
    //       ),
    //     ],
    //   ),
    // );

    final deskripsiTempatWisata = Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Flexible(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Review:\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: tempatWisata.fields.deskripsiTempatWisata,
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
                                bool result = await TempatWisataServices()
                                    .deleteTempatWisata(
                                  tempatWisataId: tempatWisata.pk,
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
                                          const TempatWisataPage()),
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
          titleTempatWisata,
          provinsiTempatWisataList,
          deskripsiTempatWisata,
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
