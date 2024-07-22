import 'package:flutter/material.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/widget/resetPassBase.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({super.key});

  TextEditingController emailController = TextEditingController();

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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Reset Password', style: TextStyles.Heading2Medium),
                    const Gap(8),
                    Text(
                        'Enter the email address you used when you\njoined and we’ll send you instructions to reset\nyour password.',
                        style: TextStyles.TextLReguler.copyWith(
                            color: AppColors.Neutral500)),
                    const Gap(40),
                    resetPassTextField(
                      hintText: 'Enter your email....',
                      type: 'email',
                      iconName: AssetsData.Sms,
                      controllerName: emailController,
                      // obscure: false
                    ),
                  ],
                ),
                const Gap(355),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('You remember your password',
                                style: TextStyles.TextMMedium.copyWith(
                                    color: AppColors.Neutral400)),
                            const Gap(6),
                            TextButton(
                              onPressed: () {
                                // Get.toNamed(MyRoutes.Login);
                              },
                              child: Text('Login',
                                  style: TextStyles.TextMMedium.copyWith(
                                      color: AppColors.Primary500)),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      ElevatedButtoncustom(
                        onPressed: () {
                          Get.toNamed(MyRoutes.ResetPass2);
                        },
                        text: "Request password reset",
                      ),
                    ]),
              ]),
        ),
      ),
    );
  }
}
