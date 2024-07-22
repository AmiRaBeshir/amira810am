import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:get/get.dart';

import '../../../controller/loginController.dart';

class loginTextField extends StatelessWidget {
  final String hintText;
  final String type;
  final String iconName;
  final TextEditingController controllerName;
  LoginController txtController = Get.put(LoginController());

  loginTextField({
    super.key,
    required this.hintText,
    required this.type,
    required this.iconName,
    required this.controllerName,
  });
  Color borderColor = AppColors.Neutral300;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: type == 'password' ?txtController.control: controllerName,
      controller: controllerName,

      onChanged: (value) {
        if (type == 'password') {
          txtController.control = controllerName;
          txtController.changeColor();
          txtController.changeBtnColor();
          borderColor = txtController.borderColor;
        }
      },

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyles.MediumReguler.copyWith(color: AppColors.Neutral400),
        prefixIcon: InkWell(
          child: Image.asset(iconName),
          onTap: () {},
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: AppColors.Neutral300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: AppColors.Primary500),
        ),
        suffixIcon: type == 'password'
            ? InkWell(
                onTap: () {
                  txtController.toggleVisibility();
                },
                child: txtController.isPasswordVisible
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              )
            : null,
      ),
      obscureText:
          type == 'password' ? !txtController.isPasswordVisible : false,
      keyboardType:
          type == 'email' ? TextInputType.emailAddress : TextInputType.text,
    );
  }
}
