import 'package:flutter/material.dart';
import 'package:jim/kuliner/models/kuliner_models.dart';
import 'package:jim/kuliner/pages/tempat_kuliner_detail.dart';
import 'package:jim/kuliner/pages/tempat_kuliner_form.dart';

import '../../activity/widgets/drawer.dart';
import '../models/base_response.dart';
import '../services/tempat_kuliner_services.dart';

class kulinerPage extends StatefulWidget {
  const kulinerPage({super.key});

  @override
  State<kulinerPage> createState() => _kulinerPageState();
}

class _kulinerPageState extends State<kulinerPage> {
  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(BaseResponseTempatKuliner tempatKuliner) => ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        child: const Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        tempatKuliner.fields.namaTempatKuliner,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TempatKulinerDetailPage(tempatKuliner: tempatKuliner)));
      },
    );

    Card makeCard(BaseResponseTempatKuliner tempatKuliner) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.lightBlueAccent.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        child: makeListTile(tempatKuliner),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat Kuliner'),
      ),
      drawer: const DrawerApp(),
      body: FutureBuilder<ResponseModel>(
          future: TempatKulinerServices().getDataKulinerByUserId(),
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
                      "Tidak ada tempat Kuliner",
                      style:
                      TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                  );
                }
              } else {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada tempat Kuliner",
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => TempatKulinerForm()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}