import 'package:amira810am/controller/homescreencontroller.dart';
import 'package:amira810am/model/allJobsModel.dart';
import 'package:get/get.dart';

HomeScreenController hsc = Get.find();

class DataCrossPages extends GetxController {
  HomeScreenController hsc =
      Get.put<HomeScreenController>(HomeScreenController());
  Data job = Data();

  List<String> isSaved = [];

  void addSavedJob(String id) {
    isSaved.add(id);
  }

  void removeSavedJob(String id) {
    isSaved.remove(id);
  }
}
