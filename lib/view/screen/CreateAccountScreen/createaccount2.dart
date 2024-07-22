import 'package:amira810am/view/widget/createAccountBase.dart';
import 'package:flutter/material.dart';
import 'package:amira810am/controller/createaccount2controller.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/model/createaccountmodel.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Createaccount2Screen extends StatelessWidget {
  const Createaccount2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 68,
                      child: Text("What type of work are you \n interested in?",
                          style: TextStyles.Heading3Medium),
                    ),
                  ],
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42,
                      child: Text(
                          "Tell us what you’re interested in so we can \n customise the app for your needs.",
                          style: TextStyles.TextLReguler.copyWith(
                            color: AppColors.Gray1,
                          )),
                    ),
                  ],
                ),
                const Gap(36),
                SizedBox(
                  height: 560,
                  child: GetBuilder<CreateAccount2Controller>(
                      init: CreateAccount2Controller(),
                      builder: (controller) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: CreateAccountModel.inersets.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                controller.toggleColor(index);
                              },
                              child: interstedCard(
                                  CreateAccountModel.inersets[index]['title']!,
                                  CreateAccountModel.inersets[index]['image']!,
                                  CreateAccountModel.isInersetsCliced[index]),
                            );
                          },
                        );
                      }),
                ),
                const Gap(66),
                ElevatedButtoncustom(
                  text: "Next",
                  onPressed: () {
                    Get.toNamed(MyRoutes.CreateAccount3);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
