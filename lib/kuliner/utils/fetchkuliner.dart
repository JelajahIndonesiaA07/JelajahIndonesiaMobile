import 'package:http/http.dart' as http;
import 'package:jim/kuliner/models/kuliner_models.dart';
import 'dart:convert';

List<Kuliner> kulinerTotal = [];

Future<List<Kuliner>> fetchkuliner() async {
  var url =
      Uri.parse('https://jelajah-indonesia.up.railway.app/tempat_kuliner/get-tempat-kuliner-flutter/');
  var response = await http.get(
    url,
  );
  
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Kuliner> kuliner = [];
  for (var d in data) {
    if (d != null) {
      kuliner.add(Kuliner.fromJson(d));
      kulinerTotal.add(Kuliner.fromJson(d));
    }
  }
  return kuliner;
}