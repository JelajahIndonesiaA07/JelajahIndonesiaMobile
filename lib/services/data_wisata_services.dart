import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jim/tempat_wisata/model/tempat_wisata_model.dart';

class DataWisataServices {
  Future<TempatWisata?> getDataWisataByUserId(int userId) async {
    final response = await http.post(
        Uri.parse(
            "https://jelajah-indonesia.up.railway.app/tempat_wisata/get-data-by-userid/"),
        headers: {"Accept": "application/json"},
        body: {"user_id": userId});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      TempatWisata result = TempatWisata.fromJson(data);
      return result;
    }

    return null;
  }
}
