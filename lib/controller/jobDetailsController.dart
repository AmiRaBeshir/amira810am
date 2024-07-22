import 'package:amira810am/controller/searchResultController.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:get/get.dart';

class JobDetailsController extends GetxController {
  List<String> items = [
    'UI/UX Designer',
    'Flutter Developer',
    'Web Developer',
    'Instructor',
  ];
  List<Map<String, String>> employees = [
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': AssetsData.DimasProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': AssetsData.DimasProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': AssetsData.DimasProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': AssetsData.DimasProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': AssetsData.DimasProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': AssetsData.DimasProfile,
      'duration': '5'
    },
  ];

  SearchResultController searchresult =
      Get.put<SearchResultController>(SearchResultController());

  int pageIndex = 0;

  String menuText = 'Select Item';

  void changeIndex(int index) {
    pageIndex = index;
    update();
  }

  void changeMenuText(String text) {
    menuText = text;
    update();
  }
}
