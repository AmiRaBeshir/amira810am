import 'package:flutter/material.dart';
import 'package:amira810am/controller/phoneAndPasswordController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Phone number', style: TextStyles.Heading4Medium),
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
              const Gap(44),
              Text('Main phone number', style: TextStyles.TextLReguler),
              const Gap(8),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Use the phone number to reset your\n password',
                      style: TextStyles.TextMReguler.copyWith(
                          color: AppColors.Neutral500)),
                  GetBuilder<PhoneAndPasswordController>(
                      init: PhoneAndPasswordController(),
                      builder: (logic) {
                        return FlutterSwitch(
                          width: 48,
                          height: 26,
                          toggleSize: 20,
                          value: logic.isSwitched,
                          borderRadius: 30.0,
                          onToggle: (val) {
                            logic.changeIsSwitched(val);
                          },
                        );
                      }),
                ],
              ),
              SizedBox(
                height: 0.53 * height,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.TermsAndConditionsScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 48),
                    backgroundColor: AppColors.Primary500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  child: Text(
                    "save",
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
