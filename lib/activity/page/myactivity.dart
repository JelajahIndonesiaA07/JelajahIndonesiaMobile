import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
// ignore: unused_import
import '../page/detail.dart';
import '../function/fetch.dart';
import '../models/base.dart';
import '../models/activity.dart';

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
          title: const Text('Aktivitas yang Dapat Dilakukan'),
        ),
        drawer: const DrawerApp(),
        body: FutureBuilder(
            future: ActivityServices().fetchActivity(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  ResponseModel datas = snapshot.data;
                  if (datas.data.isNotEmpty) {
                    return ListView.builder(
                        itemCount: datas.data.length,
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
                                              activity: datas.data[index],
                                            ),
                                          ));
                                    },
                                    title: Text(
                                        datas.data[index].fields.title),
                                  )),
                            ));
                  }else {
                  return const Center(
                    child:
                    Text(
                      "Tidak ada Aktivitas",
                      style:
                      TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                  );
                }
              } else {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada Aktivitas",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
                }
              }
            }));
  }
}

// class _ActivityState extends State<ActivityPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('List Tempat Kuliner'),
//       ),
//       drawer: const DrawerApp(),
//       body: FutureBuilder(
//         future: fetchActivity(),
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.data == null) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             if (!snapshot.hasData) {
//               return Column(
//                 children: const [
//                   Text(
//                     "Tidak Ada List Tempat Kuliner",
//                     style: TextStyle(color: Colors.deepPurple, fontSize: 20),
//                   ),
//                   SizedBox(height: 8),
//                 ],
//               );
//             } else {
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (_, i) => Container(
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 8),
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15.0),
//                         boxShadow: const [
//                         BoxShadow(color: Colors.black, blurRadius: 2.0)
//                       ]),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ActivityDetailPage(
//                                       activity:
//                                           snapshot.data![i])),
//                             );
//                           },
//                           child: Row(
//                             children: [

//                               Text(
//                                 "${snapshot.data![i].fields.title}",
//                                 style: const TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),

//                               const SizedBox(
//                               height: 20,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ));
//             }
//           }
//         },
//       ),
//     );
//   }
// }

// class ActivityPage extends StatefulWidget {
//   const ActivityPage({super.key});

//   @override
//   State<ActivityPage> createState() => _ActivityPageState();
// }

// class _ActivityPageState extends State<ActivityPage> {
//   @override
//   Widget build(BuildContext context) {
//     ListTile makeListTile(BaseResponseActivity activity) => ListTile(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//           leading: Container(
//             padding: const EdgeInsets.only(right: 12.0),
//             child: const Icon(Icons.autorenew, color: Colors.white),
//           ),
//           title: Text(
//             activity.fields.title,
//           ),
//           // trailing: Checkbox(
//           //   value: myWatchList.statusWatched,
//           //   onChanged: (bool? newValue) {
//           //     setState(() {
//           //       myWatchList.statusWatched = !myWatchList.statusWatched;
//           //     });
//           //   },
//           // ),
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         ActivityDetailPage(Activity: Activity)));
//           },
//         );

//     Card makeCard(BaseResponseActivity Activity) => Card(
//           margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//               color: Colors.lightBlueAccent.shade400,
//             ),
//             borderRadius: const BorderRadius.all(Radius.circular(12)),
//           ),
//           child: Container(
//             child: makeListTile(Activity),
//           ),
//         );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tempat Wisata'),
//       ),
//       drawer: const DrawerApp(),
//       body: FutureBuilder<ResponseModel>(
//           future: ActivityServices().getDataWisataByUserId(),
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else {
//               if (snapshot.hasData) {
//                 ResponseModel data = snapshot.data;

//                 if (data.data.isNotEmpty) {
//                   return ListView.builder(
//                       itemCount: data.data.length,
//                       itemBuilder: (_, index) => makeCard(data.data[index]));
//                 } else {
//                   return const Center(
//                     child: Text(
//                       "Tidak ada tempat wisata",
//                       style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
//                     ),
//                   );
//                 }
//               } else {
//                 return Column(
//                   children: const [
//                     Text(
//                       "Tidak ada tempat wisata",
//                       style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
//                     ),
//                     SizedBox(height: 8),
//                   ],
//                 );
//               }
//             }
//           }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => ActivityForm()));
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
