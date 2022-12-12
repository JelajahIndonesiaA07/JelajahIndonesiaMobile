import 'package:jim/emergencycall/models/emergencycall.dart';

class ResponseModel {
  ResponseModel({
    required this.msg,
    required this.data,
  });

  final String msg;
  final List<Emergencycall> data;
}