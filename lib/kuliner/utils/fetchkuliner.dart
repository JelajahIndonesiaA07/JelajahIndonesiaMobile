import 'package:http/http.dart' as http;
import 'package:jim/kuliner/models/kuliner_models.dart';
import 'dart:convert';

Future<List<Kuliner>> fetchkuliner() async {
    var url = Uri.parse(
      'https://jelajah-indonesia.up.railway.app/tempat_kuliner/get-tempat-kuliner-flutter/',
    );
    var response = await http.get(
      url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Kuliner> kuliner = [];
    for (var d in data) {
      if (d != null) {
        kuliner.add(Kuliner.fromJson(d));
      }
    }

    return kuliner;
  }