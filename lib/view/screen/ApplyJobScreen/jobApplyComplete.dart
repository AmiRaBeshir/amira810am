import 'package:flutter/material.dart';
import 'package:amira810am/controller/jobapplycompletecontroller.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class JobApplyCompleteScreen extends StatelessWidget {
  JobApplyCompleteController controller = Get.put(JobApplyCompleteController());
  // JobApplyController jobApplyController = Get.find();

  JobApplyCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ElevatedButtoncustom(
          text: 'Back to home',
          onPressed: () {
            controller.isApplyed = true;
            Get.offAllNamed(MyRoutes.HomeScreen);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text('Apply Job', style: TextStyles.Heading4Medium),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsData.DataIlustration,
                  ),
                  const Gap(24),
                  Text(
                    'Your data has been',
                    style: TextStyles.Heading3Medium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ' successfully sent',
                    style: TextStyles.Heading3Medium,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(12),
                  Text(
                    'You will get a message from our team, about the announcement of employee acceptance',
                    style: TextStyles.TextLReguler.copyWith(
                        color: AppColors.Neutral500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
