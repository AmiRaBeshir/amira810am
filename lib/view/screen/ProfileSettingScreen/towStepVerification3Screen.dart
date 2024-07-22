import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class TowStepVerification3Screen extends StatelessWidget {
  const TowStepVerification3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = Get.width;
    double height = Get.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Two-step verification', style: TextStyles.Heading4Medium),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter the 6 digit code',
                style: TextStyles.TextLMedium,
              ),
              // ignore: prefer_const_constructors
              Gap(12),
              Text(
                'Please confirm your account by entering the authorization code sen to ****-****-7234',
                style: TextStyles.TextMReguler.copyWith(
                    color: AppColors.Neutral500),
              ),
              const Gap(21),

              OTPTextField(
                length: 6,
                width: double.infinity,
                fieldWidth: 44,
                style: const TextStyle(fontSize: 18),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {},
              ),
              const Gap(16),

              Row(
                children: [
                  Text(
                    'Resend code  ',
                    style: TextStyles.TextLMedium.copyWith(
                        color: AppColors.Neutral500),
                  ),
                  Countup(
                    begin: 60,
                    end: 0,
                    duration: const Duration(seconds: 60),
                    separator: ',',
                    style: TextStyles.TextLMedium.copyWith(
                        color: AppColors.Primary500),
                  ),
                  Text('s',
                      style: TextStyles.TextLMedium.copyWith(
                          color: AppColors.Primary500)),
                ],
              ),
              SizedBox(
                height: 0.5 * height,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.LoginAndSecurityScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 48),
                    backgroundColor: AppColors.Primary500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  child: Text(
                    "Verfiy",
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
