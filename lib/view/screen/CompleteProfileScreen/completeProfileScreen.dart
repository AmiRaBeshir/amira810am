import 'package:flutter/material.dart';
import 'package:amira810am/controller/completeProfileController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/widget/CompleteProfileWidget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});
  CompleteProfileController controller = Get.put(CompleteProfileController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Complete Profile', style: TextStyles.Heading4Medium),
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
          child: GetBuilder<CompleteProfileController>(builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircularPercentIndicator(
                      radius: 0.20 * width,
                      lineWidth: 0.03 * width,
                      backgroundColor: AppColors.Neutral200,
                      progressColor: AppColors.Primary500,
                      percent: controller.counter == 0
                          ? 0
                          : controller.counter == 1
                              ? 0.25
                              : controller.counter == 2
                                  ? 0.5
                                  : controller.counter == 3
                                      ? 0.75
                                      : 1,
                      center: Text(
                        controller.counter == 0
                            ? '0%'
                            : controller.counter == 1
                                ? '25%'
                                : controller.counter == 2
                                    ? '50%'
                                    : controller.counter == 3
                                        ? '75%'
                                        : '100%',
                        style: TextStyles.Heading3Medium.copyWith(
                          color: AppColors.Primary500,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      animationDuration: 2000,
                    ),
                  ),
                  const Gap(20),
                  Center(
                    child: Text(
                      ' ${controller.counter}/4 Completed',
                      style: TextStyles.TextLMedium.copyWith(
                        color: AppColors.Primary500,
                      ),
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Complete your profile before applying for a job',
                    style: TextStyles.TextLReguler.copyWith(
                      color: AppColors.Primary500,
                    ),
                  ),
                  const Gap(34),
                  InkWell(
                    onTap: () {
                      Get.toNamed(MyRoutes.EditPersonalDetails);
                      if (controller.complete[0] == false) {
                        controller.changeComplete(index: 0);
                      }
                    },
                    child: box(
                        mainText: 'Personal Details',
                        text:
                            'Full name, email, phone number, and your\naddress',
                        color: controller.complete[0] == false
                            ? AppColors.Neutral300
                            : AppColors.Primary300,
                        backColor: controller.complete[0] == true
                            ? AppColors.Neutral100
                            : AppColors.White),
                  ),
                  Container(
                      height: 0.02 * height,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: controller.complete[0] == false
                              ? AppColors.Neutral300
                              : AppColors.Primary500,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      Get.toNamed(MyRoutes.EducationScreen);
                    },
                    child: box(
                        mainText: 'Education',
                        text:
                            'Enter your educational history to be\nconsidered by the recruiter',
                        color: controller.complete[1] == false
                            ? AppColors.Neutral300
                            : AppColors.Primary500,
                        backColor: controller.complete[1] == true
                            ? AppColors.Neutral100
                            : AppColors.White),
                  ),
                  Container(
                      height: 0.02 * height,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: controller.complete[1] == false
                              ? AppColors.Neutral300
                              : AppColors.Primary500,
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Get.toNamed(MyRoutes.ExperienceScreen);
                        if (controller.complete[2] == false) {
                          controller.changeComplete(index: 2);
                        }
                      },
                      child: box(
                          mainText: 'Experience',
                          text:
                              'Enter your work experience to be considered\nby the recruiter',
                          color: controller.complete[2] == false
                              ? AppColors.Neutral300
                              : AppColors.Primary500,
                          backColor: controller.complete[2] == true
                              ? AppColors.Neutral100
                              : AppColors.White)),
                  Container(
                      height: 0.02 * height,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: controller.complete[2] == false
                              ? AppColors.Neutral300
                              : AppColors.Primary500,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      if (controller.complete[3] == false) {
                        controller.changeComplete(index: 3);
                      }
                      Get.toNamed(MyRoutes.EditUploadPortfolio);
                    },
                    child: box(
                        mainText: 'Portfolio',
                        text:
                            'Create your portfolio. Applying for various\ntypes of jobs is easier.r',
                        color: controller.complete[3] == false
                            ? AppColors.Neutral300
                            : AppColors.Primary500,
                        backColor: controller.complete[3] == true
                            ? AppColors.Neutral100
                            : AppColors.White),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
