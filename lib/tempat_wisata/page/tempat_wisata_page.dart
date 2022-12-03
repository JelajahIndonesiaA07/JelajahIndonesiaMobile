import 'package:flutter/material.dart';
import 'package:jim/tempat_wisata/model/tempat_wisata_model.dart';
import 'package:jim/tempat_wisata/page/tempat_wisata_detail.dart';
import '../fetch.dart';
import '../drawer.dart';

class TempatWisataPage extends StatefulWidget {
  const TempatWisataPage({super.key});

  @override
  State<TempatWisataPage> createState() => _TempatWisataPageState();
}

class _TempatWisataPageState extends State<TempatWisataPage> {
  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(TempatWisata tempatWisata) => ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        child: const Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        tempatWisata.provinsi,
      ),
      // trailing: Checkbox(
      //   value: myWatchList.statusWatched,
      //   onChanged: (bool? newValue) {
      //     setState(() {
      //       myWatchList.statusWatched = !myWatchList.statusWatched;
      //     });
      //   },
      // ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TempatWisataDetailPage(tempatWisata: tempatWisata)));
      },
    );

    Card makeCard(TempatWisata tempatWisata) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.lightBlueAccent.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        child: makeListTile(tempatWisata),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat Wisata'),
      ),
      drawer: const DrawerPage(),
      body: FutureBuilder(
          future: tempatwisataFetch(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada tempat wisata",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => makeCard(snapshot.data![index]));
              }
            }
          }),
    );
  }
}