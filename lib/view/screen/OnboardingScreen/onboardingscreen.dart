import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:amira810am/controller/onboardingcontroller.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/model/onboardingmodel.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/widget/onboardingwidget.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return OnboardingPage(data: onboardingModel.OnboardingData);
  }
}

class OnboardingPage extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();

  final List<Map<String, String>> data;
  OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final h = Get.height;

    OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * .8,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CarouselSlider.builder(
                        carouselController: buttonCarouselController,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Column(
                              children: [
                                onboardingWidget(data: data[itemIndex]),
                              ],
                            ),
                        options: CarouselOptions(
                          height: double.infinity,
                          initialPage: 0,
                          autoPlay: false,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            controller.setCurrentPage(index);
                          },
                        )),
                  ),
                  // SizedBox(
                  //   width: 327,
                  //   height: 21,
                  // child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(AssetsData.Logoone),
                        TextButton(
                          onPressed: () {
                            GetStorage().write('onboarding', true);
                            GetStorage().read('token') == null
                                ? Get.toNamed(MyRoutes.Login)
                                : Get.toNamed(MyRoutes.HomeScreen);
                          },
                          child: Text("Skip",
                              style: TextStyles.TextLReguler.copyWith(
                                  color: AppColors.Neutral500)),
                        )
                      ]),
                  // ),
                ],
              ),
            ),
            GetBuilder<OnboardingController>(
              builder: (controller) => DotsIndicator(
                dotsCount: data.length,
                position: controller.currentPage,
                decorator: const DotsDecorator(
                  color: AppColors.Primary200,
                  activeColor: AppColors.Primary500,
                  size: Size(6, 6),
                  activeSize: Size(10, 10),
                ),
              ),
            ),
            const Gap(20),
            GetBuilder<OnboardingController>(
              init: OnboardingController(),
              builder: (controller) => ElevatedButton(
                  onPressed: () async {
                    if (controller.currentPage == data.length - 1) {
                      GetStorage().write('onboarding', true);
                      GetStorage().read('token') == null
                          ? Get.toNamed(MyRoutes.CreateAccount)
                          : Get.toNamed(MyRoutes.HomeScreen);
                    } else {
                      buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);

                      controller.setCurrentPage(controller.currentPage + 1);
                    }
                    log("Current Page: ${controller.currentPage}" as num);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 48),
                    backgroundColor: AppColors.Primary500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: controller.currentPage == data.length - 1
                      ? Text(
                          'Get Started',
                          style: TextStyles.TextSMedium.copyWith(
                              color: AppColors.White),
                        )
                      : Text(
                          "Next",
                          style: TextStyles.TextSMedium.copyWith(
                              color: AppColors.White),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
