import 'package:flutter/material.dart';
import 'package:amira810am/controller/phoneAndPasswordController.dart';
import 'package:amira810am/controller/twoStepVerificationController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TwoStepVerification extends StatelessWidget {
  TwoStepVerification({super.key});

  final TwoStepVerificationController twoStepVerificationController =
      Get.put<TwoStepVerificationController>(TwoStepVerificationController());

  @override
  Widget build(BuildContext context) {
    // double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Two-step verification', style: TextStyles.Heading4Medium),
        leading: InkWell(
            onTap: () => twoStepVerificationController.index == 0
                ? Get.back()
                : twoStepVerificationController.subIndex(),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: AppColors.Neutral300),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Secure your account with\ntwo-step verification',
                        style: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral500),
                      ),
                      GetBuilder<PhoneAndPasswordController>(
                          init: PhoneAndPasswordController(),
                          builder: (logic) {
                            return FlutterSwitch(
                              width: 48,
                              height: 16,
                              toggleSize: 22,
                              value: logic.isSwitched,
                              borderRadius: 30.0,
                              onToggle: (val) {
                                logic.changeIsSwitched(val);
                              },
                            );
                          }),
                    ],
                  ),
                ),
              ),
              const Gap(32),
              GetBuilder<TwoStepVerificationController>(builder: (logic) {
                return logic.index == 0
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                  radius: 44,
                                  backgroundColor: AppColors.Primary100,
                                  child: Icon(
                                    Icons.lock_open,
                                    color: AppColors.Primary500,
                                  )),
                              const Gap(12),
                              Text(
                                'Two-step verification provides additional\nsecurity by asking for a verification code\nevery time you log in on another device.',
                                style: TextStyles.TextMReguler.copyWith(
                                    color: AppColors.Neutral500),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                  radius: 44,
                                  backgroundColor: AppColors.Primary100,
                                  child: Icon(
                                    Icons.chrome_reader_mode,
                                    color: AppColors.Primary500,
                                  )),
                              const Gap(12),
                              Text(
                                'Adding a phone number or using an\nauthenticator will help keep your account\nsafe from harm.',
                                style: TextStyles.TextMReguler.copyWith(
                                    color: AppColors.Neutral500),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select a verification method',
                            style: TextStyles.TextLReguler,
                          ),
                          const Gap(8),
                          SizedBox(
                            height: 56,
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            width: 1,
                                            color: AppColors.Neutral300))),
                                items: const [
                                  DropdownMenuItem<String>(
                                      child: Text("Telephone number (SMS)"))
                                ],
                                onChanged: (v) {}),
                          ),
                          const Gap(16),
                          Text(
                            'Note : Turning this feature will sign you out anywhere\n you’re currently signed in. We will then require you to\n enter a verification code the first time you sign with a\n new device or Joby mobile application.',
                            style: TextStyles.TextMReguler.copyWith(
                                color: AppColors.Neutral500),
                          ),
                        ],
                      );
              }),
              SizedBox(
                height: 0.1 * height,
              ),
              ElevatedButton(
                  onPressed: () => twoStepVerificationController.index == 1
                      ? Get.toNamed(MyRoutes.TowStepVerification2Screen)
                      : twoStepVerificationController.addIndex(),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 48),
                    backgroundColor: AppColors.Primary500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  child: Text(
                    "Next",
                    style:
                        TextStyles.TextLMedium.copyWith(color: AppColors.White),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
