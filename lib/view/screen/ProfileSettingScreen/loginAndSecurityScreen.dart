import 'package:flutter/material.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';

import 'package:amira810am/view/widget/loginandsecurity.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Login and security', style: TextStyles.Heading4Medium),
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
        child: Column(
          children: [
            const Gap(32),
            Container(
              width: double.infinity,
              color: AppColors.Neutral200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  'Accont access',
                  style: TextStyles.TextMMedium.copyWith(
                    color: AppColors.Neutral500,
                  ),
                ),
              ),
            ),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed(MyRoutes.EmailAddressScreen);
                      },
                      child: textbot(text: 'Email address')),
                  InkWell(
                      onTap: () => Get.toNamed(MyRoutes.PhoneNumberScreen),
                      child: textbot(text: 'Phone number')),
                  InkWell(
                      onTap: () => Get.toNamed(MyRoutes.ChangePasswordScreen),
                      child: textbot(text: 'Change password')),
                  InkWell(
                      onTap: () => Get.toNamed(MyRoutes.TwoStepVerification),
                      child: textbot(text: 'Two-step verification')),
                ],
              ),
            ),
            InkWell(child: textbot(text: 'Face ID')),
          ],
        ),
      ),
    );
  }
}
