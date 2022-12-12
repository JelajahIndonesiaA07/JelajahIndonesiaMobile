import 'dart:convert';
import 'package:flutter/material.dart';
import '../Profile_User/form.dart';
import 'models/models.dart';
import '../Profile_User/detail.dart';
import 'package:http/http.dart' as http;
import '../Profile_User/profile.dart';
import 'package:jim/activity/widgets/drawer.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<List<Profile>> fetchProfile() async {
    var url =
        Uri.parse('https://jelajah-indonesia.up.railway.app/kuisioner/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Profile> profile = [];
    for (var d in data) {
      if (d != null) {
        profile.add(Profile.fromJson(d));
      }
    }
    return profile;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pengguna Lainnya'),
        ),
        drawer: const DrawerApp(),
        body: FutureBuilder(
            future: fetchProfile(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Anda belum memiliki profile, Harap mengisi data diri terlebih dahulu",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        modelProfile:
                                            snapshot.data![index].fields)),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  border: Border.all(
                                      // color: snapshot.data![index].fields.watched
                                      //     ? Colors.green
                                      //     : Colors.red,
                                      ),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 2.0)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.nama}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Checkbox(
                                      //     value: snapshot
                                      //         .data![index].fields.watched,
                                      //     onChanged: (bool? value) {
                                      //       setState(() {
                                      //         snapshot.data![index].fields
                                      //             .watched = value!;
                                      //       });
                                      //     }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                }
              }
            }));
  }
}
  // @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Forum"),
//         ),
//         body: ListView.builder(
//           itemBuilder: (context, index) {
//             return Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 3,
//               margin: EdgeInsets.all(10),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Icon(
//                           Icons.chat_rounded,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Flexible(
//                           child: Container(
//                             padding: EdgeInsets.only(right: 13.0),
//                             child: Text(
//                               _profile[index].negara,
//                               overflow: TextOverflow.clip,
//                               style: TextStyle(
//                                 fontSize: 14.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Icon(
//                           Icons.person,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           _profile[index].nama,
//                           style: TextStyle(color: Colors.grey.shade500),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Icon(
//                           Icons.mark_chat_read_rounded,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Flexible(
//                           child: Container(
//                             padding: EdgeInsets.only(right: 13.0),
//                             child: Text(
//                               _profile[index].tujuan,
//                               overflow: TextOverflow.clip,
//                               style: TextStyle(
//                                 fontSize: 14.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Text(_forums[index].pertanyaan,
//                     // style: TextStyle(
//                     //   fontSize: 18,
//                     // )),
//                     // Text("- " + _forums[index].nama),
//                     // Text(_forums[index].jawaban,
//                     // style: TextStyle(
//                     //   fontSize: 18,
//                     // )),
//                     // Text("- " + _forums[index].namaAdmin),
//                   ],
//                 ),
//               ),
//             );
//           },
//           itemCount: _profile.length,
//         ));
//   }
// }
