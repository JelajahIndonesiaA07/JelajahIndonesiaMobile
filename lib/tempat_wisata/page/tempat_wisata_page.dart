import 'package:flutter/material.dart';
import 'package:jim/tempat_wisata/model/tempat_wisata_model.dart';
import 'package:jim/tempat_wisata/page/tempat_wisata_detail.dart';
import 'package:jim/tempat_wisata/page/tempat_wisata_form.dart';

import '../../activity/widgets/drawer.dart';
import '../model/base_response.dart';
import '../services/tempat_wisata_services.dart';

class TempatWisataPage extends StatefulWidget {
  const TempatWisataPage({super.key});

  @override
  State<TempatWisataPage> createState() => _TempatWisataPageState();
}

class _TempatWisataPageState extends State<TempatWisataPage> {
  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(BaseResponseTempatWisata tempatWisata) => ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        child: const Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        tempatWisata.fields.namaTempatWisata,
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

    Card makeCard(BaseResponseTempatWisata tempatWisata) => Card(
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
      drawer: const DrawerApp(),
      body: FutureBuilder<ResponseModel>(
          future: TempatWisataServices().getDataWisataByUserId(),
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
                      "Tidak ada tempat wisata",
                      style:
                      TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                  );
                }
              } else {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada tempat wisata",
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => TempatWisataForm()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
