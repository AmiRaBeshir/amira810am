import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:amira810am/Api/endpoinds.dart';
import 'package:amira810am/controller/datacrosspagescontroller.dart';
import 'package:amira810am/model/savejobmodel.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

DataCrossPages selectedJob = Get.put<DataCrossPages>(DataCrossPages());
SaveJobModel sj = SaveJobModel();

class SaveJobApi {
  Future<SaveJobModel> SaveJob(
      {required String jobID, required String location}) async {
    try {
      final dio = Dio();
      String token = await GetStorage().read('token');

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $token";
      // "Bearer ${sharedPreferences.read('token')}";
      final response =
          await dio.post(EndPoint.saveJob, data: {'job_id': int.parse(jobID)});
      if (response.statusCode == 200) {
        debugPrint('job save success');
      } else {
        debugPrint('errooooor');
      }
      sj = SaveJobModel.fromJson(response.data);
      debugPrint(sj.toJson().toString());
    } on Exception catch (e) {
      if (e is DioException) {
        debugPrint('Dio error:');
        debugPrint('  Type: ${e.type}');
        debugPrint('  Message: ${e.message}');
      } else {
        // Handle other types of errors
        debugPrint('Unexpected error: $e');
      }
      rethrow;
    }
    return sj;
  }
}
