import 'package:jim/kuliner/utils/fetchkuliner.dart';
import 'package:jim/kuliner/models/kuliner_models.dart';
import 'package:jim/activity/widgets/drawer.dart';
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
        title: const Text('List Tempat Kuliner'),
      ),
      drawer: const DrawerApp(),
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
                    "Tidak Ada List Tempat Kuliner",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20),
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
                        decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 2.0)
                      ]),
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

                              const SizedBox(
                              height: 20,
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
        title: const Text('Detail Tempat Kuliner'),
      ),
      drawer: const DrawerApp(),
      body: Container(
        child: Stack(children: [
          Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 86, 86, 86).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),

                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 34, 29, 186),
                  ), 

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Text(
                        kuliner.fields.namaTempatKuliner,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        kuliner.fields.ratingTempatKuliner,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        kuliner.fields.lokasiTempatKuliner,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(
                      height: 20,
                      ),

                    ],
                  ),
                ),

          // Column(
          //   children: [
          //     Column(children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             kuliner.fields.namaTempatKuliner,
          //             style:
          //                 TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          //             textAlign: TextAlign.center,
          //           ),
          //         ],
          //       ),
          //     ]),

          //     Column(
          //       children: [
          //         Row(
          //           children: [
          //             Text("Release Date: ",
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold)),
          //             Text(
          //                 kuliner.fields.ratingTempatKuliner
          //                     .toString()
          //                     .substring(0.bitLength),
          //                 style: TextStyle(fontSize: 16)),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             const Text("Rating: ",
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold)),
          //             Text(kuliner.fields.lokasiTempatKuliner.toString(),
          //                 style: TextStyle(fontSize: 16)),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             const Text("Review: ",
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold)),
          //           ],
          //         ),
          //         Row(children: [
          //           Flexible(
          //             child: Text(kuliner.fields.ratingTempatKuliner.toString(),
          //                 style: TextStyle(fontSize: 16)),
          //           )
          //         ])
          //       ],
          //     ),
          //   ],
          // ),


          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 200, 48, 48),
                  minimumSize: const Size.fromHeight(60),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}