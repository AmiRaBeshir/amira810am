import 'package:flutter/material.dart';
import 'package:amira810am/controller/createaccountcontroller.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:get/get.dart';

Widget interstedCard(String title, IconData icon, bool isClicked) {
  final w = Get.width;
  final h = Get.height;
  return Container(
    width: w * 0.45,
    height: h * 0.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
          color: isClicked ? AppColors.Primary500 : AppColors.Neutral100,
          width: 2),
    ),
    child: Card(
      color: isClicked ? AppColors.Primary100 : AppColors.Neutral100,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.Neutral100, width: 2),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.Neutral100,
                child: Icon(
                  icon,
                  size: 40,
                  color:
                      isClicked ? AppColors.Primary500 : AppColors.Primary900,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: AppColors.Primary900),
            ),
          ],
        ),
      ),
    ),
  );
}

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
          borderColor = txtController.borderColor;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.Neutral300, fontSize: 14),
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