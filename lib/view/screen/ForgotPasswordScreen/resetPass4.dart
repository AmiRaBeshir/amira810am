import 'package:flutter/material.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ResetPass4Screen extends StatelessWidget {
  const ResetPass4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 190),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  AssetsData.Done,
                ),
                const Gap(24),
                Text('Password changed\nsuccesfully!',
                    textAlign: TextAlign.center,
                    style: TextStyles.Heading3Medium),
                const Gap(12),
                Text(
                    "Your password has been changed successfully,\nwe will let you know if there are more problems\nwith your account",
                    textAlign: TextAlign.center,
                    style: TextStyles.TextLReguler.copyWith(
                        color: AppColors.Neutral500)),
                const Gap(219),
                ElevatedButtoncustom(
                  onPressed: () {
                    Get.toNamed(MyRoutes.HomeScreen);
                  },
                  text: "Open email app",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
