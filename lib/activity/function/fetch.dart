import '../models/activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/base.dart';

// Future<List<Activity>> fetchActivity() async {
//   var url = Uri.parse(
//       'https://jelajah-indonesia.up.railway.app/activity/get-activity-flutter/');
//   var response = await http.get(
//     url,
//     headers: {
//       "Access-Control-Allow-Origin": "*",
//       "Content-Type": "application/json",
//     },
//   );

//   // melakukan decode response menjadi bentuk json
//   var data = jsonDecode(utf8.decode(response.bodyBytes));

//   // melakukan konversi data json menjadi object Activity
//   List<Activity> listActivity = [];
//   for (var d in data) {
//     if (d != null) {
//       listActivity.add(Activity.fromJson(d));
//     }
//   }

//   return listActivity;
// }

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

class ActivityServices {
  Future<ResponseModel> fetchActivity() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? userId = prefs.getInt('USERID');
      if (userId == null) {
        ResponseModel(
            msg: "User tidak ditemukan, silahkan login kembali",
            data: List.empty());
      }
      final body = json.encode({"user_id": userId});

      final response = await http.post(
          Uri.parse(
              "https://jelajah-indonesia.up.railway.app/activity/ambil-activity-flutter/"),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
          },
          body: body);
      if (response.statusCode == 200) {
        List<dynamic> res = json.decode(response.body);
        List<BaseResponseActivity> data = [];
        for (int i = 0; i < res.length; i++) {
          data.add(
              BaseResponseActivity.fromJson(res[i] as Map<String, dynamic>));
        }
        return ResponseModel(msg: "Berhasil", data: data);
      }

      return ResponseModel(msg: response.body, data: List.empty());
    } catch (e) {
      return ResponseModel(msg: e.toString(), data: List.empty());
    }
  }

  Future<ResponseModel> addActivity({
    required String title,
    required String description,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('USERID');
    if (userId == null) {
      return ResponseModel(
          msg: "User tidak ditemukan, silahkan login kembali",
          data: List.empty());
    }

    final body = json.encode({
      "user_id": userId,
      "title": title,
      "description": description,
    });

    final response = await http.post(
        Uri.parse(
            "https://jelajah-indonesia.up.railway.app/activity/tambah-activity-flutter/"),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
        },
        body: body);
    print(response.body);
    Map<String, dynamic> result = json.decode(response.body);

    if (response.statusCode == 200) {
      return ResponseModel(msg: result["hasil"], data: List.empty());
    }

    return ResponseModel(msg: result["hasil"], data: List.empty());
  }

  Future<bool> deleteTemapatWisata({
    required int ActivityId,
  }) async {
    final body = json.encode({"activity_id": ActivityId});

    final response = await http.post(
        Uri.parse(
            "https://jelajah-indonesia.up.railway.app/tempat_wisata/delete-data/"),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
        },
        body: body);

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
