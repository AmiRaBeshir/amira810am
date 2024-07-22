import 'package:flutter/material.dart';
import 'package:amira810am/controller/loginController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/widget/loginBase.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../shared/styles/colors/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Image.asset(AssetsData.Logoone, height: 19),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 0),
              child: Column(
                  //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login', style: TextStyles.Heading3Medium),
                        const Gap(8),
                        Text('Please login to find your dream job',
                            style: TextStyles.TextLReguler.copyWith(
                                color: AppColors.Neutral500)),
                        const Gap(24),
                        loginTextField(
                          hintText: 'Username',
                          type: 'email',
                          iconName: AssetsData.Profile,
                          controllerName: emailController,
                          // obscure: false
                        ),
                        const Gap(16),
                        GetBuilder<LoginController>(builder: (controller) {
                          return loginTextField(
                            hintText: 'password',
                            type: 'password',
                            iconName: AssetsData.Lock,
                            controllerName: passwordController,
                            // obscure: controller.isPasswordVisible
                          );
                        }),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GetBuilder<LoginController>(
                                    builder: (controller) {
                                  return Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: WidgetStateProperty.all(
                                        controller.isChecked
                                            ? AppColors.Primary500
                                            : AppColors.White),
                                    value: controller.isChecked,
                                    onChanged: (bool? value) {
                                      controller.isChecked = value!;
                                      controller.update();
                                    },
                                  );
                                }),
                                Text('Remember me',
                                    style: TextStyles.TextMReguler.copyWith(
                                        color: AppColors.Neutral800)),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(MyRoutes.ResetPass);
                              },
                              child: Text('Forgot Password?',
                                  style: TextStyles.TextMReguler.copyWith(
                                      color: AppColors.Primary500)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(60),
                    SizedBox(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dont’t have an account?',
                              style: TextStyles.TextMMedium.copyWith(
                                  color: AppColors.Neutral400)),
                          const Gap(6),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(MyRoutes.CreateAccount);
                            },
                            child: Text('Register',
                                style: TextStyles.TextMMedium.copyWith(
                                    color: AppColors.Primary500)),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    GetBuilder<LoginController>(builder: (controller) {
                      return ElevatedButton(
                          onPressed: () async {
                            await controller.loginApi(
                                email: emailController.text,
                                password: passwordController.text);

                            GetStorage().read('token') != null
                                ? Get.toNamed(MyRoutes.HomeScreen)
                                : Get.showSnackbar(
                                    const GetSnackBar(
                                      title: 'Something went wrong',
                                      message: 'Try Again Later',
                                      duration: Duration(seconds: 2),
                                      backgroundColor: AppColors.Danger400,
                                    ),
                                  );
                            !controller.isChecked
                                ? GetStorage().remove('token')
                                : null;
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(327, 48),
                            backgroundColor: controller.btnColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Login',
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
                          Text("Or Login With Account",
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
                  ])),
        ));
  }
}
