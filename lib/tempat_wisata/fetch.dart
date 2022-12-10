import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/tempat_wisata_model.dart';

Future<List<TempatWisata>> tempatwisataFetch() async {
  var url = Uri.parse('https://jelajah-indonesia.up.railway.app/tempat_wisata/get-data-by-userid/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<TempatWisata> listTempatWisata = [];
  for (var d in data) {
    if (d != null) {
      listTempatWisata.add(TempatWisata.fromJson(d));
    }
  }

  return listTempatWisata;
}