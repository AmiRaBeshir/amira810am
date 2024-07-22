import 'package:flutter/material.dart';
import 'package:amira810am/Api/registerapi.dart';
import 'package:amira810am/model/createaccprofilemodel.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CreateAccountController extends GetxController {
  GetStorage storage = GetStorage();

  bool isPasswordVisible = false;
  Color borderColor = AppColors.Neutral300;
  Color btnColor = AppColors.Neutral300;
  Color textColor = AppColors.Neutral500;
  String myController = '';
  bool isPasswordValid = false;
  TextEditingController control = TextEditingController();
  void toggleVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void changeBtnColor() {
    control.text.length >= 8
        ? {
            btnColor = AppColors.Primary500,
            isPasswordValid = true,
          }
        : btnColor = AppColors.Neutral300;
    update();
  }

  void changetextColor() {
    control.text.length >= 8
        ? {
            textColor = AppColors.White,
            isPasswordValid = true,
          }
        : btnColor = AppColors.Neutral500;
    update();
  }

  void changeColor() {
    control.text.length >= 8
        ? borderColor = AppColors.Primary500
        : control.text.isEmpty
            ? borderColor = AppColors.Neutral300
            : borderColor = AppColors.Danger500;
    update();
  }

  RegisterApi api = RegisterApi();
  CreateAccProfileModel profile = CreateAccProfileModel();
  bool isLoading = false;

  Future<CreateAccProfileModel> registerApi(
      {required String name,
      required String email,
      required String password}) async {
    profile = (await api.getProfileModel(
        name: name, email: email, password: password))!;
    storage.write('token', profile.token);
    debugPrint(GetStorage().read('token').toString());

    update();
    return profile;
  }
}
