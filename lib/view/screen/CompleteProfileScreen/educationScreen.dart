import 'package:flutter/material.dart';
import 'package:amira810am/controller/completeProfileController.dart';
import 'package:amira810am/controller/editpersonaldetailscontroller1.dart';
import 'package:amira810am/controller/educationcontroller.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EducationScreen extends StatelessWidget {
  EducationScreen({super.key});
  CompleteProfileController completeProfileController =
      Get.put<CompleteProfileController>(CompleteProfileController());

  EditPersonalDetailsController1 editPersonalDetailsController =
      Get.put<EditPersonalDetailsController1>(EditPersonalDetailsController1());

  @override
  Widget build(BuildContext context) {
    EducationController eduController =
        Get.put<EducationController>(EducationController());
    TextEditingController universityController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    // double width = Get.width;
    // double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ُEducation', style: TextStyles.Heading4Medium),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 1, color: AppColors.Neutral300)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 17),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'University *',
                            style: TextStyles.TextLMedium.copyWith(
                                color: AppColors.Neutral400),
                          ),
                          const Gap(6),
                          TextFormField(
                            controller: universityController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: AppColors.Neutral300))),
                          ),
                          const Gap(16),
                          Text(
                            'Title',
                            style: TextStyles.TextLMedium.copyWith(
                                color: AppColors.Neutral400),
                          ),
                          const Gap(6),
                          TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: AppColors.Neutral300))),
                          ),
                          const Gap(16),
                          Text(
                            'Start Year',
                            style: TextStyles.TextLMedium.copyWith(
                                color: AppColors.Neutral400),
                          ),
                          const Gap(6),
                          GetBuilder<EducationController>(
                              builder: (controller) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.Neutral300)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.startDate
                                              .toString()
                                              .split(' ')[0],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              controller.startDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      firstDate: DateTime(1970),
                                                      lastDate: DateTime.now(),
                                                      initialDate:
                                                          DateTime.now());
                                              if (controller.startDate !=
                                                  null) {
                                                controller.update();
                                              }
                                            },
                                            icon: const Icon(
                                                Icons.calendar_month)),
                                      ],
                                    ),
                                  ),
                                ),
                                const Gap(16),
                                Text(
                                  'End Year',
                                  style: TextStyles.TextLMedium.copyWith(
                                      color: AppColors.Neutral400),
                                ),
                                const Gap(6),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.Neutral300)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.endDate
                                              .toString()
                                              .split(' ')[0],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              controller.endDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      firstDate: DateTime(1970),
                                                      lastDate: DateTime.now(),
                                                      initialDate:
                                                          DateTime.now());
                                              if (controller.startDate !=
                                                  null) {
                                                controller.update();
                                              }
                                            },
                                            icon: const Icon(
                                                Icons.calendar_month)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                          const Gap(32),
                          ElevatedButtoncustom(
                            text: "Save",
                            onPressed: () async {
                              eduController.setData(
                                  uni: universityController.text,
                                  tit: titleController.text);
                              if (completeProfileController.complete[1] ==
                                  false) {
                                completeProfileController.changeComplete(
                                    index: 1);
                              }
                              await editPersonalDetailsController
                                  .editProfileSendData(
                                      bio: '',
                                      address: '',
                                      mobile: '',
                                      edu: universityController.text.toString(),
                                      exp: '');
                            },
                          ),
                        ]),
                  ),
                ),
                const Gap(24),
                GetBuilder<EducationController>(builder: (controller) {
                  return eduController.university != null &&
                          eduController.title != null
                      ? Container(
                          height: 99,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: AppColors.Neutral300)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  AssetsData.Logouniversity,
                                ),
                                const Gap(12),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.university!,
                                      style: TextStyles.TextLMedium,
                                    ),
                                    const Gap(4),
                                    Text(controller.title!,
                                        style: TextStyles.TextLMedium.copyWith(
                                            color: AppColors.Neutral500)),
                                    const Gap(4),
                                    Text(
                                        '${controller.startDate?.year.toString()} - ${controller.endDate?.year.toString()}',
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
                      : Container();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
