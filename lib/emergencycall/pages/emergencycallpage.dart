import 'package:jim/emergencycall/pages/fetchemergencycall.dart';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:jim/activity/widgets/drawer.dart';
import 'package:flutter/material.dart';


class EmergencycallPage extends StatefulWidget {
  const EmergencycallPage({Key? key}) : super(key: key);

  @override
  State<EmergencycallPage> createState() => _EmergencycallState();
}

class _EmergencycallState extends State<EmergencycallPage> {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Rumah Sakit'),
      ),
      drawer: const DrawerApp(),
      body: FutureBuilder(
        future: fetchEmergencyCall(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak Ada Rumah Sakit",
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
                        color: Color.fromARGB(255, 54, 47, 154),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 2.0)
                      ]),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmergencycallDetail(
                                      Emergencycall:
                                           listEmergencyCallTotal[i])),
                            );
                          },
                          child: Row(
                            children: [

                              Text(
                                "${snapshot.data![i].fields.hospitalName}",
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


class EmergencycallDetail extends StatelessWidget {
  const EmergencycallDetail({super.key, required this.Emergencycall});

  final Emergencycall;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Rumah Sakit'),
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
                        Emergencycall.fields.hospitalName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      Text(
                        "0" + Emergencycall.fields.hospitalNumber.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        Emergencycall.fields.hospitalLocation,
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
