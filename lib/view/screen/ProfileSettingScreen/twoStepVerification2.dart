import 'package:flutter/material.dart';
import 'package:amira810am/controller/phoneAndPasswordController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class TowStepVerification2Screen extends StatelessWidget {
  TowStepVerification2Screen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final PhoneAndPasswordController getController =
      Get.put(PhoneAndPasswordController());

  @override
  Widget build(BuildContext context) {
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
                'Add phone number',
                style: TextStyles.TextLMedium,
              ),
              const Gap(4),
              Text(
                'We will send a verification code to this number',
                style: TextStyles.TextMReguler.copyWith(
                    color: AppColors.Neutral500),
              ),
              const Gap(16),
              IntlPhoneField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(),
                  ),
                ),
                initialCountryCode: 'EG',
                onChanged: (phone) {},
              ),
              const Gap(20),
              Text(
                'Enter your password',
                style: TextStyles.TextLMedium,
              ),
              const Gap(8),
              GetBuilder<PhoneAndPasswordController>(
                init: PhoneAndPasswordController(),
                builder: (logic) => TextFormField(
                  obscureText: num == 1
                      ? getController.obscureText1
                      : num == 2
                          ? getController.obscureText2
                          : getController.obscureText3,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.Neutral300),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'password',
                      suffixIcon: InkWell(
                        onTap: () {
                          {
                            num == 1
                                ? getController.changeObscureText1()
                                : num == 2
                                    ? getController.changeObscureText2()
                                    : getController.changeObscureText3();
                          }
                        },
                        child: (num == 1
                                ? getController.obscureText1
                                : num == 2
                                    ? getController.obscureText2
                                    : getController.obscureText3)
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: AppColors.Primary500,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: AppColors.Primary500,
                              ),
                      )),
                ),
              ),
              SizedBox(
                height: 0.4 * height,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.TowStepVerification3Screen);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 48),
                    backgroundColor: AppColors.Primary500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  child: Text(
                    "Send Code",
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
