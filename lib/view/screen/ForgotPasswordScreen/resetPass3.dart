import 'package:flutter/material.dart';
import 'package:amira810am/controller/resetPassController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';

import 'package:amira810am/view/widget/resetPassBase.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ResetPass3Screen extends StatelessWidget {
  ResetPass3Screen({super.key});

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.Neutral900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset(AssetsData.Logoone, height: 19),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Create new password', style: TextStyles.Heading3Medium),
            const Gap(8),
            Text('Set your new password so you can login and\nacces Jobsque',
                style: TextStyles.TextLReguler.copyWith(
                    color: AppColors.Neutral500)),
            const Gap(44),
            GetBuilder<resetPassController>(
              builder: (controller) => resetPassTextField(
                hintText: 'New password',
                type: 'password',
                iconName: AssetsData.Lock,
                controllerName: newPassword,
              ),
            ),
            const Gap(12),
            Text('Password must be at least 8 characters',
                style: TextStyles.TextLReguler.copyWith(
                    color: AppColors.Neutral400)),
            const Gap(24),
            GetBuilder<resetPassController>(
              builder: (controller2) => resetPassTextField(
                hintText: 'Confirm password',
                type: 'password',
                iconName: AssetsData.Lock,
                controllerName: confirmPassword,
              ),
            ),
            const Gap(12),
            Text('Both password must match',
                style: TextStyles.TextLReguler.copyWith(
                    color: AppColors.Neutral400)),
            const Gap(266),
            ElevatedButtoncustom(
              onPressed: () {
                Get.toNamed(MyRoutes.ResetPass4);
              },
              text: "Open email app",
            ),
          ]),
        ),
      ),
    );
  }
}
