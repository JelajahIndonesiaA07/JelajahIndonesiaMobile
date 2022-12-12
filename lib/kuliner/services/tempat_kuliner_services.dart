import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jim/kuliner/models/kuliner_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jim/kuliner/models/base_response.dart';


class TempatKulinerServices {
  Future<ResponseModel> getDataKulinerByUserId() async {
    try {

      final prefs = await SharedPreferences.getInstance();
      final int? userId = prefs.getInt('USERID');
      if(userId == null){
        ResponseModel(msg: "User tidak ditemukan, silahkan login kembali", data: List.empty());
      }
      final body = json.encode({"user_id": userId});

      final response = await http.post(
          Uri.parse(
              "https://jelajah-indonesia.up.railway.app/tempat_kuliner/get-data-by-userid/"),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
          },
          body: body);
      if (response.statusCode == 200) {
        List<dynamic> res = json.decode(response.body);
        List<BaseResponseTempatKuliner> data = [];
        for (int i = 0; i < res.length; i++) {
          data.add(BaseResponseTempatKuliner.fromJson(
              res[i] as Map<String, dynamic>));
        }
        return ResponseModel(msg: "Berhasil", data: data);
      }

      return ResponseModel(msg: response.body, data: List.empty());
    } catch (e) {
      return ResponseModel(msg: e.toString(), data: List.empty());
    }
  }

  Future<ResponseModel> addTempatKuliner({
    required String namaTempatKuliner,
    required String ratingTempatKuliner,
    required String lokasiTempatKuliner,
  }) async {

    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('USERID');
    if(userId == null){
      return ResponseModel(msg: "User tidak ditemukan, silahkan login kembali", data: List.empty());
    }

    final body = json.encode({
      "user_id": userId,
      "nama_tempat_kuliner": namaTempatKuliner,
      "rating_tempat_kuliner": ratingTempatKuliner,
      "lokasi_tempat_kuliner": lokasiTempatKuliner
    });

    final response = await http.post(
        Uri.parse(
            "https://jelajah-indonesia.up.railway.app/tempat_kuliner/add-data/"),
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

  Future<bool> deleteTempatKuliner({
    required int tempatKulinerId,
  }) async {
    final body = json.encode({"kuliner_id": tempatKulinerId});

    final response = await http.post(
        Uri.parse(
            "https://jelajah-indonesia.up.railway.app/tempat_kuliner/delete-data/"),
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