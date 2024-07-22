import 'package:flutter/material.dart';
import 'package:amira810am/controller/completeProfileController.dart';
import 'package:amira810am/controller/editpersonaldetailscontroller1.dart';
import 'package:amira810am/controller/experiencecontroller.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ExperienceScreen extends StatelessWidget {
  ExperienceScreen({super.key});

  TextEditingController positionController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController startYearController = TextEditingController();
  ExperienceController experienceController =
      Get.put<ExperienceController>(ExperienceController());
  CompleteProfileController completeProfileController =
      Get.put<CompleteProfileController>(CompleteProfileController());
  EditPersonalDetailsController1 editPersonalDetailsController =
      Get.put<EditPersonalDetailsController1>(EditPersonalDetailsController1());

  @override
  Widget build(BuildContext context) {
    // double width = Get.width;
    // double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Experience', style: TextStyles.Heading4Medium),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: AppColors.Neutral300)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Position *',
                        style: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral400),
                      ),
                      const Gap(6),
                      TextFormField(
                        controller: positionController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.Neutral300))),
                      ),
                      const Gap(16),
                      Text(
                        'Title',
                        style: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral400),
                      ),
                      const Gap(6),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(width: 1))),
                          items: const [
                            DropdownMenuItem<String>(child: Text("Full Time")),
                          ],
                          onChanged: (v) {}),
                      const Gap(16),
                      Text(
                        'Company name *',
                        style: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral400),
                      ),
                      const Gap(6),
                      TextFormField(
                        controller: companyNameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.Neutral300))),
                      ),
                      const Gap(16),
                      Text(
                        'Location',
                        style: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral400),
                      ),
                      const Gap(6),
                      TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.Neutral300),
                            ),
                            prefixIcon: const Icon(Icons.location_pin)),
                      ),
                      const Gap(6),
                      GetBuilder<ExperienceController>(builder: (logic) {
                        return Row(
                          children: [
                            Checkbox(
                                value: logic.checkbox,
                                onChanged: (v) {
                                  logic.changeCheck(v);
                                }),
                            const Gap(8),
                            Text(
                              'I am currently working in this role',
                              style: TextStyles.TextMMedium,
                            ),
                          ],
                        );
                      }),
                      const Gap(16),
                      Text(
                        'Start Year *',
                        style: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral400),
                      ),
                      const Gap(6),
                      TextFormField(
                        controller: startYearController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.Neutral300))),
                      ),
                      const Gap(32),
                      ElevatedButtoncustom(
                        text: 'Save',
                        onPressed: () async {
                          if (completeProfileController.complete[1] == false) {
                            completeProfileController.changeComplete(index: 1);
                          }
                          await editPersonalDetailsController
                              .editProfileSendData(
                                  bio: '',
                                  address: '',
                                  mobile: '',
                                  edu: '',
                                  exp: companyNameController.text);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(24),
              Container(
                height: 99,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: AppColors.Neutral300)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsData.Group15495,
                      ),
                      const Gap(12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Senior UI/UX Designer',
                            style: TextStyles.TextLMedium,
                          ),
                          const Gap(4),
                          Text('Remote • GrowUp Studio',
                              style: TextStyles.TextLMedium.copyWith(
                                  color: AppColors.Neutral500)),
                          const Gap(4),
                          Text('2019 - 2022',
                              style: TextStyles.TextLMedium.copyWith(
                                  color: AppColors.Neutral400)),
                        ],
                      ),
                      const Icon(
                        Icons.edit,
                        size: 24,
                        color: AppColors.Primary500,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
