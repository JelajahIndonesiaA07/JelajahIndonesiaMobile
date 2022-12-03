import 'package:flutter/material.dart';
import '../drawer.dart';
import '../model/tempat_wisata_model.dart';
// import 'package:intl/intl.dart';

class TempatWisataDetailPage extends StatelessWidget {
  final TempatWisata tempatWisata;
  const TempatWisataDetailPage({super.key, required this.tempatWisata});


  @override
  Widget build(BuildContext context) {
    // String reviewText = Text("Review");
    final titleTempatWisata = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          tempatWisata.nama_wisata,
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
          Text(
              tempatWisata.nama_kota,
              style: const TextStyle(fontSize: 20)
            ),
        ],
      ),
    );

    final alamatTempatWisataList = Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          const Text(
            "Alamat: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
              tempatWisata.alamat,
              style: const TextStyle(fontSize: 20)
          ),
        ],
      ),
    );

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
                        text:tempatWisata.deskripsi,
                      ),
                    ],
                  ),
                )),
          ],
        ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const DrawerPage(),
      body: Column(
        children: <Widget>[
          titleTempatWisata,
          provinsiTempatWisataList,
          alamatTempatWisataList,
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