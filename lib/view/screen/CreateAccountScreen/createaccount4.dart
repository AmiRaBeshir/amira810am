import 'package:flutter/material.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';

import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CreateAccount4Screen extends StatelessWidget {
  const CreateAccount4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Gap(
                      150,
                    ),
                    Image.asset(
                      AssetsData.SuccessAccIlu,
                    ),
                    const Gap(
                      32,
                    ),
                    Text("Your account has been set up!",
                        style: TextStyles.Heading3Medium,
                        textAlign: TextAlign.center),
                    const Gap(8),
                    Text(
                      "We have customized feeds according to your \n preferences",
                      textAlign: TextAlign.center,
                      style: TextStyles.TextMReguler.copyWith(
                          color: AppColors.Neutral500),
                    ),
                  ],
                ),
                const Gap(
                  150,
                ),
                ElevatedButtoncustom(
                  text: "Get Started",
                  onPressed: () {
                    Get.toNamed(MyRoutes.HomeScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
