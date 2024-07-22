import 'package:flutter/material.dart';
import 'package:amira810am/controller/phoneAndPasswordController.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/widget/passTxtField.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final PhoneAndPasswordController passwordController =
      Get.put<PhoneAndPasswordController>(PhoneAndPasswordController());

  @override
  Widget build(BuildContext context) {
    // double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Change password', style: TextStyles.Heading4Medium),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GetBuilder<PhoneAndPasswordController>(
              init: PhoneAndPasswordController(),
              builder: (logic) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your old password',
                        style: TextStyles.TextLReguler,
                      ),
                      const Gap(8),
                      passwordTextField(
                        controller: oldPasswordController,
                        name: 'old password',
                        num: 1,
                      ),
                      const Gap(20),
                      Text(
                        'Enter your new password',
                        style: TextStyles.TextLReguler,
                      ),
                      const Gap(8),
                      passwordTextField(
                          controller: newPasswordController,
                          name: 'new password',
                          num: 2),
                      const Gap(20),
                      Text(
                        'confirm your new password',
                        style: TextStyles.TextLReguler,
                      ),
                      const Gap(8),
                      passwordTextField(
                          controller: confirmPasswordController,
                          name: 'Confirm your new password',
                          num: 3),
                      SizedBox(
                        height: 0.35 * height,
                      ),
                      ElevatedButton(
                          onPressed: () => () async {
                                if (newPasswordController.text.length ==
                                        confirmPasswordController.text.length &&
                                    oldPasswordController.text.isNotEmpty &&
                                    newPasswordController.text.isNotEmpty &&
                                    confirmPasswordController.text.isNotEmpty) {
                                  await passwordController.changePaswword(
                                      newPasswordController.text);
                                  Get.back();
                                } else {
                                  Get.snackbar('wrong',
                                      'the new and confirm  are not similar or There is an empty field ');
                                }
                              },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(327, 48),
                            backgroundColor: AppColors.Primary500,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyles.TextLMedium.copyWith(
                                color: AppColors.White),
                          )),
                    ]);
              }),
        ),
      ),
    );
  }
}
