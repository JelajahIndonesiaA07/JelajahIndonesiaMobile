import 'package:jim/kuliner/models/kuliner_models.dart';

class ResponseModel {
  ResponseModel({
    required this.msg,
    required this.data,
  });

  final String msg;
  final List<BaseResponseTempatKuliner> data;
}