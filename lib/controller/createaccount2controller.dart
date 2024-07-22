import 'package:amira810am/model/createaccountmodel.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateAccount2Controller extends GetxController {
  void toggleColor(int index) {
    CreateAccountModel.isInersetsCliced[index] =
        CreateAccountModel.inersets[index];
    update();
  }
}
