import 'package:flutter/material.dart';
import 'package:amira810am/controller/resetPassController.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:get/get.dart';

class resetPassTextField extends StatelessWidget {
  final String hintText;
  final String type;
  final String iconName;
  final TextEditingController controllerName;
  resetPassController txtController = Get.put(resetPassController());

  resetPassTextField({
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
          borderColor = txtController.borderColor;
        }
      },

      decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              TextStyles.TextMReguler.copyWith(color: AppColors.Neutral400),
          prefixIcon: InkWell(
            child: Image.asset(iconName),
            onTap: () {},
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.Neutral400)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: txtController.borderColor),
          ),
          suffixIcon: type == 'password'
              ? hintText == "New password"
                  ? InkWell(
                      onTap: () {
                        txtController.toggleVisibility();
                      },
                      child: txtController.isPasswordVisible
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    )
                  : InkWell(
                      onTap: () {
                        txtController.toggleVisibility2();
                      },
                      child: txtController.isPasswordVisible2
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    )
              : null),
      obscureText: type == 'password'
          ? hintText == "New password"
              ? txtController.isPasswordVisible
              : txtController.isPasswordVisible2
          : false,
      keyboardType:
          type == 'email' ? TextInputType.emailAddress : TextInputType.text,
    );
  }
}
