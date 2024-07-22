import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OnboardingController extends GetxController {
  int currentPage = 0;
  void setCurrentPage(int page) {
    currentPage = page;
    update();
  }
}
