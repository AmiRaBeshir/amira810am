import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:amira810am/controller/profileScreenController.dart';
import 'package:amira810am/controller/edituploadportfoliocontroller.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EditUploadPortfolioScreen extends StatelessWidget {
  const EditUploadPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditUploadPortfolioController());
    ProfileScreenController profController =
        Get.put<ProfileScreenController>(ProfileScreenController());
    // profController.getPortfolio();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Portfolio', style: TextStyles.Heading4Medium),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add portfolio here', style: TextStyles.Heading4Reguler),
                const Gap(16),
                DottedBorder(
                  color: AppColors.Primary500.withOpacity(0.5),
                  strokeWidth: 3,
                  dashPattern: const [5, 5],
                  strokeCap: StrokeCap.butt,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  child: Container(
                    color: AppColors.Bluelight.withOpacity(0.2),
                    width: double.infinity,
                    height: 223,
                    child: Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          top: 16,
                          bottom: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 32,
                              backgroundColor: AppColors.Primary100,
                              child: Icon(
                                Icons.file_upload_outlined,
                                size: 50,
                                color: AppColors.Primary500,
                              ),
                            ),
                            const Gap(16),
                            Text('Upload your other file',
                                style: TextStyles.Heading5Medium),
                            const Gap(8),
                            Text('Max size 10MB',
                                style: TextStyles.TextSReguler.copyWith(
                                    color: AppColors.Neutral500)),
                            const Gap(16),
                            GetBuilder<EditUploadPortfolioController>(
                              builder: (controller) => InkWell(
                                onTap: () async {
                                  await controller.uploadFile();

                                  controller.model.status ??
                                      Get.snackbar(
                                        'Error',
                                        'Please try again',
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: AppColors.White,
                                        backgroundColor: AppColors.Danger500,
                                      );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.Primary100,
                                    border:
                                        Border.all(color: AppColors.Primary500),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  width: 295,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.upload_file_outlined,
                                          color: AppColors.Primary500),
                                      const Gap(10),
                                      Text(
                                        controller.isLoading
                                            ? 'Uploading...'
                                            : 'Add File',
                                        style: TextStyles.TextMMedium.copyWith(
                                          color: controller.isLoading
                                              ? AppColors.Neutral500
                                              : AppColors.Primary500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                ListView.builder(
                  itemCount: profController.gusData.data!.portfolio!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.Neutral300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AssetsData.Pdf2,
                              ),
                              const Gap(10),
                              Column(
                                children: [
                                  // Text(
                                  // profController.gusData.data!
                                  //     .portfolio![index].cvFile!,
                                  // style: TextStyles.TextMMedium),
                                  const Gap(4),
                                  Text('CV.pdf 300KB',
                                      style: TextStyles.TextSReguler),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit_note_outlined,
                                    color: AppColors.Primary500,
                                    size: 24,
                                  )),
                              const Gap(4),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.highlight_remove_outlined,
                                    color: AppColors.Danger500,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
