import 'package:flutter/material.dart';
import 'package:amira810am/controller/createaccountcontroller.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/screen/CreateAccountScreen/createaccount2.dart';
import 'package:amira810am/view/widget/creataccounttextfield.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';

class CreateAccountScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: AppColors.Black1)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset(
              AssetsData.Logoone,
              height: 19,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Cereate Account",
                      style: TextStyles.Heading2Medium,
                    ),
                    const Gap(8),
                    Text(
                      "Please create an account to find your dream job",
                      style: TextStyles.TextLReguler.copyWith(
                          color: AppColors.Neutral500),
                    ),
                    const Gap(44),
                    createAccountTextField(
                        hintText: 'username',
                        type: 'username',
                        iconName: Icons.person_outlined,
                        controllerName: nameController),
                    const Gap(16),
                    createAccountTextField(
                        hintText: 'email',
                        type: 'email',
                        iconName: Icons.email_outlined,
                        controllerName: emailController),
                    const Gap(16),
                    GetBuilder<CreateAccountController>(builder: (controller) {
                      return createAccountTextField(
                        hintText: 'password',
                        type: 'password',
                        iconName: Icons.lock_outline,
                        controllerName: passwordController,
                      );
                    }),
                    const Gap(12),
                    GetBuilder<CreateAccountController>(
                      builder: (controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Password must be at least 8 characters',
                              style: TextStyles.TextLReguler.copyWith(
                                  color: controller.borderColor ==
                                          AppColors.Primary500
                                      ? AppColors.Success500
                                      : controller.borderColor),
                            ),
                          ],
                        );
                      },
                    ),
                    const Gap(105),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                              style: TextStyles.TextMMedium.copyWith(
                                  color: AppColors.Neutral400)),
                          const Gap(6),
                          InkWell(
                              onTap: () {
                                Get.toNamed(MyRoutes.Login);
                              },
                              child: Text(
                                'Login',
                                style: TextStyles.TextMMedium.copyWith(
                                    color: AppColors.Primary500),
                              ))
                        ],
                      ),
                    ),
                    const Gap(24),
                    GetBuilder<CreateAccountController>(builder: (controller) {
                      return ElevatedButton(
                          onPressed: () async {
                            await
                                // controller.registerApi(
                                //     name: nameController.text,
                                //     email: emailController.text,
                                //     password: passwordController.text);

                                // GetStorage().read('token') != null
                                // ?

                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                // const Createaccount2Screen()))
                                Get.toNamed(MyRoutes.CreateAccount2)
                                ? Get.showSnackbar(
                                    const GetSnackBar(
                                      title: 'Something went wrong',
                                      message: 'Try Again Later',
                                      duration: Duration(seconds: 2),
                                      backgroundColor: AppColors.Danger700,
                                    ),
                                  )
                                : SizedBox();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(327, 48),
                            backgroundColor: controller.btnColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Create account',
                            style: TextStyles.TextLMedium.copyWith(
                                color: AppColors.White),
                          ));
                    }),
                    const Gap(20),
                    SizedBox(
                      height: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 65,
                            color: AppColors.Neutral300,
                          ),
                          const Gap(25),
                          Text("Or Sign up With Account",
                              style: TextStyles.MediumReguler.copyWith(
                                  color: AppColors.Neutral500)),
                          const Gap(25),
                          Container(
                            height: 1,
                            width: 65,
                            color: AppColors.Neutral300,
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 46,
                            width: 154,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: AppColors.Neutral300)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetsData.google,
                                  height: 16,
                                  width: 16,
                                ),
                                const Gap(8),
                                Text("Google",
                                    style: TextStyles.TextMMedium.copyWith(
                                        color: AppColors.Black22))
                              ],
                            ),
                          ),
                        ),
                        const Gap(19),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 46,
                            width: 154,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: AppColors.Neutral300)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetsData.Facebook,
                                  height: 20,
                                  width: 20,
                                ),
                                const Gap(8),
                                Text("Facebook",
                                    style: TextStyles.TextMMedium.copyWith(
                                        color: AppColors.Black22))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ]))),
    );
  }
}
