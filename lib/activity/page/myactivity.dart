import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
// ignore: unused_import
import '../page/detail.dart';
import '../function/fetch.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityState();
}

class _ActivityState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const DrawerApp(),
        body: FutureBuilder(
            future: fetchActivity(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(5.0),
                                child: ListTile(
                                  onTap: () {
                                    // Route menu ke halaman utama
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ActivityDetailPage(
                                            activity: snapshot.data![index],
                                          ),
                                        ));
                                  },
                                  title:
                                      Text(snapshot.data![index].fields.title),
                                )),
                          ));
                }
              }
            }));
  }
}
