import 'package:flutter/material.dart';
import 'package:amira810am/controller/createaccount3controller.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/model/createaccountmodel.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateAccount3Screen extends StatelessWidget {
  CreateAccount3Controller controller = Get.put(CreateAccount3Controller());

  bool isWorkFromOffice = false;

  CreateAccount3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 68,
                child: Text("Where are you prefefred \n Location?",
                    style: TextStyles.Heading3Medium),
              ),
              const Gap(12),
              SizedBox(
                height: 42,
                child: Text(
                    "Let us know, where is the work location you \n want at this time, so we can adjust it.",
                    style: TextStyles.TextLReguler.copyWith(
                      color: AppColors.Gray1,
                    )),
              ),
              const Gap(32),
              ToggleSwitch(
                minWidth: 160,
                cornerRadius: 20.0,
                activeBgColors: const [
                  [AppColors.Primary400],
                  [AppColors.Primary900]
                ],
                activeFgColor: AppColors.White,
                inactiveBgColor: AppColors.White,
                inactiveFgColor: AppColors.Neutral500,
                initialLabelIndex: 1,
                totalSwitches: 2,
                labels: const ['Work From Office', 'Remote Work'],
                radiusStyle: true,
                onToggle: (index) {
                  isWorkFromOffice = !isWorkFromOffice;
                  controller.update();
                },
              ),
              const Gap(24),
              GetBuilder<CreateAccount3Controller>(
                init: CreateAccount3Controller(),
                builder: (controller) => !isWorkFromOffice
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Select the country you want for your job',
                                  style: TextStyles.TextLReguler.copyWith(
                                    color: AppColors.Gray1,
                                  )),
                            ],
                          ),
                          const Gap(20),
                          Wrap(
                            spacing: 12.0, // gap between adjacent chips
                            runSpacing: 12.0, // gap between lines
                            children: [
                              for (int i = 0;
                                  i < CreateAccountModel.countries.length;
                                  i++)
                                FilterChip(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: CreateAccountModel
                                                    .isFlagCliced[i] ==
                                                true
                                            ? AppColors.Primary500
                                            : AppColors.Neutral200,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor:
                                      CreateAccountModel.isFlagCliced[i] == true
                                          ? AppColors.Primary100
                                          : AppColors.White,
                                  label: Text(
                                      CreateAccountModel.countries[i]['title']!,
                                      style: TextStyles.TextLReguler),
                                  avatar: Image.asset(
                                    CreateAccountModel.countries[i]['image'],
                                  ),
                                  onSelected: (bool value) {
                                    controller.toggleColor(i);
                                  },
                                )
                            ],
                          )
                        ],
                      )
                    : const SizedBox(),
              ),
              const Gap(66),
              ElevatedButtoncustom(
                text: "Next",
                onPressed: () {
                  Get.toNamed(MyRoutes.CreateAccount4);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
