import '../models/activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Activity>> fetchActivity() async {
  var url = Uri.parse(
      'https://jelajah-indonesia.up.railway.app/activity/get-activity-flutter/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Activity
  List<Activity> listActivity = [];
  for (var d in data) {
    if (d != null) {
      listActivity.add(Activity.fromJson(d));
    }
  }

  return listActivity;
}

// Future<List<Activity>> createAlbum(String title) async {
//   final http.Response response = await http.post(
//     Uri.parse('https://jelajah-indonesia.up.railway.app/activity/json'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//     "user": user,
//     "title": title,
//     "description": description,
//     }),
//   );
   
//   // Dispatch action depending upon
//   // the server response
//   if (response.statusCode == 201) {
//     return Activity.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Album loading failed!');
//   }
// }
