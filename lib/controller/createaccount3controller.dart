import 'package:amira810am/model/createaccountmodel.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateAccount3Controller extends GetxController {
  void toggleColor(int index) {
    CreateAccountModel.isFlagCliced[index] =
        !CreateAccountModel.isFlagCliced[index];
    update();
  }
}
