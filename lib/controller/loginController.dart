// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:amira810am/Api/loginapi.dart';
import 'package:amira810am/model/loginProfieModel.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  GetStorage storge = GetStorage();
  bool isChecked = false;

  bool isPasswordVisible = false;
  // Color borderColor = Colors.grey;
  Color borderColor = AppColors.Neutral400;
  Color btnColor = AppColors.Neutral400;
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
        : btnColor = AppColors.Neutral400;
    update();
  }

  void changeColor() {
    control.text.length >= 8
        ? borderColor = AppColors.Primary500
        : control.text.isEmpty
            ? borderColor = AppColors.Neutral400
            : borderColor = AppColors.Danger500;
    update();
  }

  LoginApi api = LoginApi();
  LoginProfileModel profile = LoginProfileModel();

  Future<LoginProfileModel> loginApi(
      {required String email, required String password}) async {
    profile = (await api.getProfileModel(email: email, password: password))!;
    GetStorage().write('token', profile.token.toString());
    GetStorage().write('userID', profile.user!.id.toString());
    debugPrint("token saved ${GetStorage().read('token')}");
    debugPrint("userId saved ${GetStorage().read('userID')}");

    update();
    return profile;
  }
}
