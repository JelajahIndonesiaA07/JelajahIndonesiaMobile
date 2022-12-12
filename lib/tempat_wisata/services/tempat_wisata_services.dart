import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jim/tempat_wisata/model/tempat_wisata_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/base_response.dart';


class TempatWisataServices {
  Future<ResponseModel> getDataWisataByUserId() async {
    try {

      final prefs = await SharedPreferences.getInstance();
      final int? userId = prefs.getInt('USERID');
      if(userId == null){
        ResponseModel(msg: "User tidak ditemukan, silahkan login kembali", data: List.empty());
      }
      final body = json.encode({"user_id": userId});

      final response = await http.post(
          Uri.parse(
              "https://jelajah-indonesia.up.railway.app/tempat_wisata/get-data-by-userid/"),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
          },
          body: body);
      if (response.statusCode == 200) {
        List<dynamic> res = json.decode(response.body);
        List<BaseResponseTempatWisata> data = [];
        for (int i = 0; i < res.length; i++) {
          data.add(BaseResponseTempatWisata.fromJson(
              res[i] as Map<String, dynamic>));
        }
        return ResponseModel(msg: "Berhasil", data: data);
      }

      return ResponseModel(msg: response.body, data: List.empty());
    } catch (e) {
      return ResponseModel(msg: e.toString(), data: List.empty());
    }
  }

  Future<ResponseModel> addTempatWisata({
    required String namaTempatWisata,
    required String provinsiTempatWisata,
    required String deskripsiTempatWisata,
  }) async {

    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('USERID');
    if(userId == null){
      return ResponseModel(msg: "User tidak ditemukan, silahkan login kembali", data: List.empty());
    }

    final body = json.encode({
      "user_id": userId,
      "nama_tempat_wisata": namaTempatWisata,
      "provinsi_tempat_wisata": provinsiTempatWisata,
      "deskripsi_tempat_wisata": deskripsiTempatWisata
    });

    final response = await http.post(
        Uri.parse(
            "https://jelajah-indonesia.up.railway.app/tempat_wisata/add-data/"),
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

  Future<bool> deleteTempatWisata({
    required int tempatWisataId,
  }) async {
    final body = json.encode({"wisata_id": tempatWisataId});

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
