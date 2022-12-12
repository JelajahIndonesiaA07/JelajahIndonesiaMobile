import 'package:jim/tempat_wisata/model/tempat_wisata_model.dart';

class ResponseModel {
  ResponseModel({
    required this.msg,
    required this.data,
  });

  final String msg;
  final List<BaseResponseTempatWisata> data;
}