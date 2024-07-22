import 'package:flutter/material.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ResetPass2Screen extends StatelessWidget {
  const ResetPass2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 204),
          child: Center(
            child: Column(children: [
              Image.asset(
                AssetsData.EmailIlustration,
              ),
              const Gap(24),
              Text('Check your Email', style: TextStyles.Heading3Medium),
              const Gap(12),
              Text('We have sent a reset password to your email\naddress',
                  textAlign: TextAlign.center,
                  style: TextStyles.TextLReguler.copyWith(
                      color: AppColors.Neutral500)),
              const Gap(266),
              ElevatedButtoncustom(
                onPressed: () {
                  Get.toNamed(MyRoutes.ResetPass3);
                },
                text: "Open email app",
              )
            ]),
          ),
        ),
      ),
    );
  }
}
