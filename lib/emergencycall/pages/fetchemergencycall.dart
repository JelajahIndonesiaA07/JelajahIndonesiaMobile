import 'dart:convert';
import 'package:jim/emergencycall/models/emergencycall.dart';
import 'package:http/http.dart' as http;

List<Emergencycall> listEmergencyCallTotal = [];

Future<List<Emergencycall>> fetchEmergencyCall() async {
  var url = Uri.parse(
      'https://jelajah-indonesia.up.railway.app/emergencycall/get-hospital-flutter/');
  var response = await http.get(
    url,
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Emergencycall> listEmergencyCall = [];
  for (var d in data) {
    if (d != null) {
      listEmergencyCall.add(Emergencycall.fromJson(d));
      listEmergencyCallTotal.add(Emergencycall.fromJson(d));
    }
  }
  return listEmergencyCall;
}
