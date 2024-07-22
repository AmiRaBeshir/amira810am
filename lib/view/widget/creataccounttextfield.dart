import 'package:flutter/material.dart';
import 'package:amira810am/controller/createaccountcontroller.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:get/get.dart';

class createAccountTextField extends StatelessWidget {
  final String hintText;
  final String type;
  final IconData iconName;
  final TextEditingController controllerName;
  CreateAccountController txtController = Get.put(CreateAccountController());

  createAccountTextField({
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
      controller: controllerName,
      onChanged: (value) {
        if (type == 'password') {
          txtController.control = controllerName;
          txtController.changeColor();
          txtController.changeBtnColor();
          txtController.changetextColor();
          borderColor = txtController.borderColor;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.Neutral400, fontSize: 14),
        prefixIcon: IconButton(
          icon: Icon(iconName),
          onPressed: () {},
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: AppColors.Neutral300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: txtController.borderColor),
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
