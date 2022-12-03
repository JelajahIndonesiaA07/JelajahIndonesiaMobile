import 'package:jim/kuliner/utils/fetchkuliner.dart';
import 'package:jim/kuliner/models/kuliner_models.dart';
import 'package:jim/kuliner/widgets/drawer.dart';
import 'package:flutter/material.dart';

class kulinerPage extends StatefulWidget {
  const kulinerPage({Key? key}) : super(key: key);

  @override
  State<kulinerPage> createState() => _kulinerState();
}

class _kulinerState extends State<kulinerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
        future: fetchkuliner(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "No watchlist available",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => kulinerDetail(
                                      kuliner:
                                          kulinerTotal[i])),
                            );
                          },
                          child: Row(
                            children: [

                              Text(
                                "${snapshot.data![i].fields.namaTempatKuliner}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}

class kulinerDetail extends StatelessWidget {
  const kulinerDetail({super.key, required this.kuliner});

  final Kuliner kuliner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: buildDrawer(context),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Column(
            children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      kuliner.fields.namaTempatKuliner,
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ]),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Release Date: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                          kuliner.fields.ratingTempatKuliner
                              .toString()
                              .substring(0.bitLength),
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Rating: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(kuliner.fields.lokasiTempatKuliner.toString(),
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Review: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(children: [
                    Flexible(
                      child: Text(kuliner.fields.ratingTempatKuliner.toString(),
                          style: TextStyle(fontSize: 16)),
                    )
                  ])
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(60),
                ),
              )
            ],
          ),
        ]),
      )),
    );
  }
}