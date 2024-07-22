import 'dart:async';
import 'package:flutter/material.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Splashview extends StatelessWidget {
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      GetStorage().read('onboarding') == null
          ? Get.offAllNamed(MyRoutes.OnboardingScreen)
          : GetStorage().read('token') == null
              ? Get.offAllNamed(MyRoutes.Login)
              : Get.offAllNamed(MyRoutes.HomeScreen);
    });
  }

  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    onInit();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 700,
          width: double.infinity,
          child: Image.asset(AssetsData.splash),
        ),
      ),
    );
  }
}
