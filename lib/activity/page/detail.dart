import 'package:jim/activity/widgets/drawer.dart';

import '../models/activity.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity activity;

  const ActivityDetailPage({Key? key, required this.activity})
      : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Detail'),
  //     ),
  //     drawer: DrawerApp(),
  //     body: Row(
  //       children: <Widget>[
  //         Expanded(
  //           flex: 1,
  //           child: Padding(
  //             padding: const EdgeInsets.all(20.0),
  //             child: Column(
  //               children: <Widget>[
  //                 Column(
  //                   children: [
  //                     Text(
  //                       activity.fields.title,
  //                       style: const TextStyle(
  //                           fontSize: 24, fontWeight: FontWeight.bold),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                     const SizedBox(height: 20),
  //                     ListTile(
  //                         title: const Padding(
  //                           padding: EdgeInsets.only(bottom: 10.0),
  //                           child: Text(
  //                             'Review: ',
  //                             style: TextStyle(
  //                                 fontSize: 16, fontWeight: FontWeight.bold),
  //                           ),
  //                         ),
  //                         dense: true,
  //                         subtitle: Text(
  //                           activity.fields.description,
  //                           style: const TextStyle(
  //                               fontSize: 14, color: Colors.black),
  //                         )),
  //                   ],
  //                 ),
  //                 const Spacer(),
  //                 TextButton(
  //                   style: TextButton.styleFrom(
  //                       backgroundColor: Colors.blue,
  //                       padding: const EdgeInsets.all(15.0),
  //                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //                       alignment: Alignment.center),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text(
  //                     "Back",
  //                     style: TextStyle(color: Colors.white),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // conditialWatch() {
  //   // Apabila activity.fields.watched == true , Maka udah ditonton, selain itu menujukkan belum nonton
  //   if (activity.fields.watched == true) {
  //     return const Text("Watched", style: TextStyle(fontSize: 16));
  //   } else {
  //     return const Text("Not Watched", style: TextStyle(fontSize: 16));
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Things To Do'),
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
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),

                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 165, 224, 167),
                  ), 

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Text(
                        activity.fields.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      Text(
                        activity.fields.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
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
                  backgroundColor: Colors.deepPurple,
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
