import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:get/get.dart';

class resetPassController extends GetxController {
  bool isPasswordVisible = false;
  bool isPasswordVisible2 = false;
  Color borderColor = AppColors.Neutral400;

  Color btnColor = AppColors.Neutral400;
  String myController = '';
  bool isPasswordValid = false;
  TextEditingController control = TextEditingController();

  void toggleVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleVisibility2() {
    isPasswordVisible2 = !isPasswordVisible2;
    update();
  }

  void changeColor() {
    control.text.length > 8
        ? borderColor = AppColors.Primary500
        : control.text.isEmpty
            ? borderColor = AppColors.Neutral400
            : borderColor = AppColors.Danger400;
    update();
  }
}
