import 'package:flutter/cupertino.dart';
import 'package:amira810am/Api/alljobsapi.dart';
import 'package:amira810am/Api/otherapi.dart';
import 'package:amira810am/model/allJobsModel.dart';
import 'package:amira810am/model/userdata.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreenController extends GetxController {
  UserData ud = UserData();
  UserDataApi udApi = UserDataApi();
  bool isLoading = true;
  JobsList jl = JobsList();
  int currentPage = 0;
  final token = GetStorage().read('token');

  GetAllJobsApi allJobsApi = GetAllJobsApi();

  get data => null;

  void pageChanged(int index) {
    currentPage = index;
    update();
  }

  Future<void> onInitFunc() async {
    isLoading = true;
    debugPrint(isLoading.toString());
    debugPrint('token  $token');

    ud = (await udApi.getUserData());
    GetStorage().write('name', ud.data!.name);
    GetStorage().write('userID', ud.data!.id);
    jl = await allJobsApi.getAllJobs();

    isLoading = false;
    debugPrint(isLoading.toString());
    update();
  }
}
