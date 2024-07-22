import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:amira810am/controller/datacrosspagescontroller.dart';
import 'package:amira810am/controller/homescreencontroller.dart';
import 'package:amira810am/controller/showSavedJobsController.dart';

import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../controller/jobApplyController.dart';

import 'package:dotted_border/dotted_border.dart';

class ReApplyJob extends StatelessWidget {
  HomeScreenController homeController = Get.find();
  JobApplyController jobApplyController =
      Get.put<JobApplyController>(JobApplyController());
  DataCrossPages selectedJob = Get.put<DataCrossPages>(DataCrossPages());
  ShowSavedJobsController ssjc =
      Get.put<ShowSavedJobsController>(ShowSavedJobsController());

  final CarouselController buttonCarouselController = CarouselController();
  final double h = Get.height;
  final double w = Get.width;
  final TextEditingController nameTxtController = TextEditingController();
  final TextEditingController emailTxtController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  ReApplyJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          GetBuilder<DataCrossPages>(
            builder: (controller) {
              return IconButton(
                icon: Icon(
                  ssjc.showSavedJobs.data != null
                      ? ssjc.showSavedJobs.data!.any(
                              (element) => element.jobId == selectedJob.job.id)
                          ? Icons.bookmarks
                          : Icons.bookmarks_outlined
                      : Icons.bookmarks_outlined,
                  color: AppColors.Primary500,
                ),
                onPressed: () async {
                  // ignore: curly_braces_in_flow_control_structures
                  if (ssjc.showSavedJobs.data != null) if (!ssjc
                      .showSavedJobs.data!
                      .any((element) => element.jobId == selectedJob.job.id)) {
                    await ssjc.saveJob(
                        JobId: selectedJob.job.id.toString(), location: ' ');
                  } else {
                    await ssjc.delFavJob(
                        id: ssjc
                            .showSavedJobs
                            .data![ssjc.showSavedJobs.data!.indexWhere(
                                (element) =>
                                    element.jobId == selectedJob.job.id)]
                            .id
                            .toString(),
                        jobId: '');
                  }
                  await ssjc.saveJob(
                      JobId: selectedJob.job.id.toString(), location: ' ');

                  controller.update();
                },
              );
            },
          )
        ],
        title: Text('Applied Job', style: TextStyles.Heading4Medium),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Image.network(
                  selectedJob.job.image!,
                ),
                const Gap(16),
                Text(selectedJob.job.name!, style: TextStyles.Heading4Medium),
                const Gap(4),
                Text(
                  '${selectedJob.job.compName!} • ${selectedJob.job.location!.split(', ')[selectedJob.job.location!.split(', ').length - 2]}, ${selectedJob.job.location!.split(', ').last}',
                  style: TextStyles.TextMReguler.copyWith(
                    color: AppColors.Neutral700,
                  ),
                ),
                const Gap(20),
                GetBuilder<JobApplyController>(
                  builder: (JobApplyController controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: jobApplyController.currentPage >= 0
                                  ? AppColors.Primary500
                                  : AppColors.Neutral500),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: jobApplyController.currentPage > 0
                              ? AppColors.Primary500
                              : AppColors.Neutral900,
                          child: Text(
                            jobApplyController.currentPage > 0 ? '✓' : '1',
                            style: TextStyles.TextLMedium.copyWith(
                                color: jobApplyController.currentPage > 0
                                    ? AppColors.White
                                    : jobApplyController.currentPage == 0
                                        ? AppColors.Primary500
                                        : AppColors.Neutral500),
                          ),
                        ),
                      ),
                      Text(
                        '.....',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: jobApplyController.currentPage >= 1
                                ? AppColors.Primary500
                                : AppColors.Neutral500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: jobApplyController.currentPage >= 1
                                  ? AppColors.Primary500
                                  : AppColors.Neutral500),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: jobApplyController.currentPage > 1
                              ? AppColors.Primary500
                              : AppColors.Neutral900,
                          child: Text(
                            jobApplyController.currentPage > 1 ? '✓' : '2',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: jobApplyController.currentPage > 1
                                    ? AppColors.White
                                    : jobApplyController.currentPage == 1
                                        ? AppColors.Primary500
                                        : AppColors.Neutral500),
                          ),
                        ),
                      ),
                      Text('.....',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: jobApplyController.currentPage >= 2
                                  ? AppColors.Primary500
                                  : AppColors.Neutral500)),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: jobApplyController.currentPage >= 2
                                  ? AppColors.Primary500
                                  : AppColors.Neutral500),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: jobApplyController.currentPage > 2
                              ? AppColors.Primary500
                              : AppColors.Neutral900,
                          child: Text(
                            jobApplyController.currentPage > 2 ? '✓' : '3',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: jobApplyController.currentPage > 2
                                  ? AppColors.White
                                  : jobApplyController.currentPage == 2
                                      ? AppColors.Primary500
                                      : AppColors.Neutral500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                SizedBox(
                  height: h * 0.7,
                  child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      height: double.infinity,
                      initialPage: 0,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      onPageChanged: (pageNum, reason) {
                        jobApplyController.setCurrentPage(pageNum);
                      },
                    ),
                    items: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Biodata', style: TextStyles.Heading4Medium),
                            const Gap(4),
                            Text('Fill in your bio data correctly',
                                style: TextStyles.TextMReguler),
                            const Gap(28),
                            RichText(
                                text: TextSpan(
                                    text: 'Full Name',
                                    style: TextStyles.TextLReguler,
                                    children: const <TextSpan>[
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.Danger500))
                                ])),
                            const Gap(8),
                            TextField(
                              controller: nameTxtController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person_outline),
                                hintText: 'Enter your full name',
                                hintStyle: TextStyles.TextMMedium,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const Gap(28),
                            RichText(
                                text: TextSpan(
                                    text: 'Email',
                                    style: TextStyles.TextLReguler,
                                    children: const <TextSpan>[
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.Danger500))
                                ])),
                            const Gap(8),
                            TextField(
                              controller: emailTxtController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email_outlined),
                                hintText: 'Enter your email',
                                hintStyle: TextStyles.TextMMedium,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const Gap(28),
                            RichText(
                                text: TextSpan(
                                    text: 'phone No',
                                    style: TextStyles.TextLReguler,
                                    children: const <TextSpan>[
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.Danger500))
                                ])),
                            const Gap(8),
                            IntlPhoneField(
                              controller: phoneNumberController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              initialCountryCode: 'EG',
                              onChanged: (phone) {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Type of work',
                                  style: TextStyles.Heading4Medium),
                              const Gap(4),
                              Text('Fill in your bio data correctly',
                                  style: TextStyles.Heading4Medium.copyWith(
                                      color: AppColors.Neutral500)),
                              const Gap(28),
                              GetBuilder<JobApplyController>(
                                  builder: (controller) => ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: jobApplyController
                                            .typeOfWorkList.length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          controller.typeOfWorkList[
                                                                      index] ==
                                                                  controller
                                                                      .workType
                                                              ? AppColors
                                                                  .Primary500
                                                              : AppColors
                                                                  .White),
                                                  color:
                                                      controller.typeOfWorkList[
                                                                  index] ==
                                                              controller
                                                                  .workType
                                                          ? AppColors.Primary100
                                                          : AppColors
                                                              .Neutral900),
                                              height: 0.1 * h,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            controller
                                                                    .typeOfWorkList[
                                                                index],
                                                            style: TextStyles
                                                                .TextLMedium),
                                                        Text(
                                                          'CV.pdf  Portfolio.pdf ',
                                                          style: TextStyles
                                                                  .TextLMedium
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .Neutral500),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Radio(
                                                    value: controller
                                                        .typeOfWorkList[index],
                                                    groupValue:
                                                        controller.workType,
                                                    onChanged: (value) {
                                                      debugPrint(value);
                                                      controller.setTypeOfWork(
                                                          type: value);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.017 * h,
                                            )
                                          ],
                                        ),
                                      ))
                            ],
                          )),
                      SizedBox(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upload portfolio',
                                  style: TextStyles.Heading4Medium,
                                ),
                                const Gap(4),
                                Text('Fill in your bio data correctlyy',
                                    style: TextStyles.Heading4Medium.copyWith(
                                        color: AppColors.Neutral500)),
                                const Gap(28),
                                RichText(
                                    text: TextSpan(
                                        text: 'Upload CV',
                                        style: TextStyles.TextLMedium,
                                        children: const <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.Danger500))
                                    ])),
                                const Gap(8),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.Neutral300),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GetBuilder<JobApplyController>(
                                    builder: (controller) => Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                AssetsData.Pdf,
                                              ),
                                              const Gap(8),
                                              Column(
                                                children: [
                                                  Text(
                                                      jobApplyController
                                                              .fileName ??
                                                          '',
                                                      style: TextStyles
                                                          .TextMMedium),
                                                  const Gap(8),
                                                  Text(
                                                    jobApplyController
                                                            .fileSize ??
                                                        '',
                                                    style: TextStyles
                                                            .TextSReguler
                                                        .copyWith(
                                                            color: AppColors
                                                                .Neutral500),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    jobApplyController
                                                        .uploadCV();

                                                    jobApplyController.update();
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit_note_outlined,
                                                    color: AppColors.Primary500,
                                                    size: 30,
                                                  )),
                                              IconButton(
                                                  onPressed: () {
                                                    jobApplyController
                                                        .pickedFile = null;
                                                    jobApplyController
                                                        .fileName = null;
                                                    jobApplyController
                                                        .fileSize = null;
                                                    jobApplyController.update();
                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .highlight_remove_outlined,
                                                    color: AppColors.Danger500,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(20),
                                Text('Other File',
                                    style: TextStyles.TextLMedium),
                                const SizedBox(
                                  height: 20,
                                ),
                                DottedBorder(
                                  color: AppColors.Primary500.withOpacity(0.5),
                                  strokeWidth: 3,
                                  dashPattern: const [5, 5],
                                  strokeCap: StrokeCap.butt,
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(10),
                                  child: Container(
                                    color:
                                        AppColors.Primary500.withOpacity(0.2),
                                    width: double.infinity,
                                    height: h * 0.27,
                                    child: GetBuilder<JobApplyController>(
                                      builder: (controller) => Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const CircleAvatar(
                                                radius: 40,
                                                backgroundColor:
                                                    AppColors.Primary100,
                                                child: Icon(
                                                  Icons.file_upload_outlined,
                                                  size: 32,
                                                  color: AppColors.Primary500,
                                                ),
                                              ),
                                              Text(
                                                  jobApplyController
                                                          .fileName2 ??
                                                      'Upload your other file',
                                                  style: TextStyles
                                                      .Heading5Medium),
                                              const Gap(8),
                                              Text(
                                                  jobApplyController
                                                          .fileSize2 ??
                                                      'Max size 10MB',
                                                  style: TextStyles.TextSReguler
                                                      .copyWith(
                                                    color: AppColors.Neutral500,
                                                  )),
                                              InkWell(
                                                onTap: () {
                                                  jobApplyController
                                                      .uploadOtherFile();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .Primary500),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  width: w * 0.6,
                                                  height: 40,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .upload_file_outlined,
                                                        size: 20,
                                                        color: AppColors
                                                            .Primary500,
                                                      ),
                                                      const Gap(10),
                                                      Text(
                                                        'Add File',
                                                        style: TextStyles
                                                                .TextLMedium
                                                            .copyWith(
                                                                color: AppColors
                                                                    .Primary500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(),
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              ]))
                    ],
                  ),
                ),
                const Gap(20),
                GetBuilder<JobApplyController>(
                  builder: (controller) => ElevatedButton(
                    onPressed: () async {
                      if (controller.currentPage == 2) {
                        controller.name = nameTxtController.text.toString();
                        controller.jobId = selectedJob.job.id!.toString();
                        controller.email = emailTxtController.text.toString();
                        controller.userId =
                            GetStorage().read('userID').toString();
                        controller.mobile =
                            phoneNumberController.text.toString();

                        await controller.sendJobApplyApi();

                        !controller.ja.status!
                            ? Get.toNamed(MyRoutes.JobApplyComplete)
                            : Get.snackbar(
                                'Error',
                                'Please fill all the fields',
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: const Color(0xffffffff),
                                backgroundColor: const Color(0xffe10000),
                              );
                      } else {
                        buttonCarouselController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                        controller.setCurrentPage(controller.currentPage + 1);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(320, 50),
                      backgroundColor: !controller.isLoading
                          ? AppColors.Primary500
                          : AppColors.Neutral900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: controller.currentPage == 2
                        ? Text(!controller.isLoading ? 'Submit' : 'uploading',
                            style: TextStyles.TextLMedium.copyWith(
                                fontSize: 16, color: AppColors.White))
                        : Text(
                            'Next',
                            style: TextStyles.TextLMedium.copyWith(
                                fontSize: 16, color: AppColors.White),
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
