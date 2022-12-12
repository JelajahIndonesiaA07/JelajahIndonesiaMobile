import '../models/emergencycall.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/baseresponse.dart';

class EmergencyCallServices {
  Future<ResponseModel> getDataEmergencyCallByUserId() async {
    try {

      final prefs = await SharedPreferences.getInstance();
      final int? userId = prefs.getInt('USERID');
      if(userId == null){
        ResponseModel(msg: "User tidak ditemukan, silahkan login kembali", data: List.empty());
      }
      final body = json.encode({"user_id": userId});

      final response = await http.post(
          Uri.parse(
              "https://jelajah-indonesia.up.railway.app/emergencycall/get-data-by-userid/"),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
          },
          body: body);
      if (response.statusCode == 200) {
        List<dynamic> res = json.decode(response.body);
        List<Emergencycall> data = [];
        for (int i = 0; i < res.length; i++) {
          data.add(Emergencycall.fromJson(
              res[i] as Map<String, dynamic>));
        }
        return ResponseModel(msg: "Berhasil", data: data);
      }

      return ResponseModel(msg: response.body, data: List.empty());
    } catch (e) {
      return ResponseModel(msg: e.toString(), data: List.empty());
    }
  }

  Future<ResponseModel> addEmergencyCall({
    required String hospital_name,
    required String hospital_number,
    required String hospital_location,
  }) async {

    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('USERID');
    if(userId == null){
      return ResponseModel(msg: "User tidak ditemukan, silahkan login kembali", data: List.empty());
    }

    final body = json.encode({
      "user_id": userId,
      "hospital_name": hospital_name,
      "hospital_number": hospital_number,
      "hospital_location": hospital_location,
    });

    final response = await http.post(
        Uri.parse(
            "https://jelajah-indonesia.up.railway.app/emergencycall/add-data/"),
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

  Future<bool> deleteEmergencyCall({
    required int emergencycallId,
  }) async {
    final body = json.encode({"hospital_id": emergencycallId});

    final response = await http.post(
        Uri.parse(
            "https://jelajah-indonesia.up.railway.app/emergencycall/delete-data/"),
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