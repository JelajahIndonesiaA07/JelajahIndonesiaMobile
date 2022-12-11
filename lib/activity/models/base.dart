import '../models/activity.dart';

class ResponseModel {
  ResponseModel({
    required this.msg,
    required this.data,
  });

  final String msg;
  final List<BaseResponseActivity> data;
}