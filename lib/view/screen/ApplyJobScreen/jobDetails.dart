import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:amira810am/controller/datacrosspagescontroller.dart';
import 'package:amira810am/controller/homescreencontroller.dart';
import 'package:amira810am/controller/jobDetailsController.dart';
import 'package:amira810am/controller/showSavedJobsController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class JobDetails extends StatelessWidget {
  HomeScreenController homeController = Get.find();

  JobDetailsController controller =
      Get.put<JobDetailsController>(JobDetailsController());
  DataCrossPages selectedJob = Get.put<DataCrossPages>(DataCrossPages());
  ShowSavedJobsController ssjc = Get.put<ShowSavedJobsController>(
      ShowSavedJobsController(),
      permanent: true);

  int index = 0;

  JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          height: 48,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            backgroundColor: AppColors.Primary500,
            onPressed: () {
              Get.toNamed(
                MyRoutes.JobApply,
              );
            },
            child: Text(
              'Apply now',
              style: TextStyles.TextLMedium.copyWith(color: AppColors.White),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                        ? ssjc.showSavedJobs.data!.any((element) =>
                                element.jobId == selectedJob.job.id)
                            ? Icons.bookmarks
                            : Icons.bookmarks_outlined
                        : Icons.bookmarks_outlined,
                    color: AppColors.Primary500,
                  ),
                  onPressed: () async {
                    // ignore: curly_braces_in_flow_control_structures
                    if (ssjc.showSavedJobs.data != null) if (!ssjc
                        .showSavedJobs.data!
                        .any(
                            (element) => element.jobId == selectedJob.job.id)) {
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
          title: Text(
            'Job Details',
            style: TextStyles.Heading4Medium,
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(children: [
                      Image.network(
                        selectedJob.job.image!,
                        height: 80,
                      ),
                      const Gap(12),
                      // Image.asset(Assets.flagsRus, height: 100),
                      Text(selectedJob.job.name!,
                          style: TextStyles.Heading4Medium),
                      const Gap(4),
                      Text(
                        '${selectedJob.job.compName!} • ${selectedJob.job.location!.toString().split(', ').last}',
                        style: TextStyles.TextSReguler.copyWith(
                          fontSize: 12,
                          color: AppColors.Neutral700,
                        ),
                      ),
                      const Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilterChip(
                            label: Text(selectedJob.job.jobType!),
                            onSelected: (bool value) {},
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: AppColors.Primary100, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: AppColors.Primary100,
                          ),
                          FilterChip(
                            label: const Text('On site'),
                            onSelected: (bool value) {},
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: AppColors.Primary100, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: AppColors.Primary100,
                          ),
                          FilterChip(
                            label: Text(selectedJob.job.jobTimeType!),
                            onSelected: (bool value) {},
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: AppColors.Primary100, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: AppColors.Primary100,
                          ),
                        ],
                      ),
                      const Gap(32),
                      ToggleSwitch(
                        minWidth: 40,
                        cornerRadius: 20.0,
                        activeBgColors: const [
                          [AppColors.Info900],
                          [AppColors.Info900],
                          [AppColors.Info900],
                        ],
                        inactiveFgColor: AppColors.Neutral500,
                        inactiveBgColor: AppColors.White,
                        activeFgColor: AppColors.White,
                        initialLabelIndex: 0,
                        totalSwitches: 3,
                        labels: const ['Desicription', 'Company', 'People'],
                        radiusStyle: true,
                        onToggle: (index) {
                          controller.changeIndex(index!);
                        },
                      ),
                      const Gap(24),

                      ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      GetBuilder<JobDetailsController>(
                        builder: (controller) => Container(
                          child: controller.pageIndex == 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Job Description',
                                      style: TextStyles.TextMMedium,
                                    ),
                                    const Gap(8),
                                    Text(
                                      selectedJob.job.jobDescription!,
                                      style: TextStyles.TextSReguler.copyWith(
                                          color: AppColors.Neutral600),
                                    ),
                                    const Gap(10),
                                    Text(
                                      'Skill Required',
                                      style: TextStyles.TextMMedium,
                                    ),
                                    const Gap(8),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: selectedJob.job.jobSkill!
                                          .toString()
                                          .split(',')
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Text(
                                            ' • ${selectedJob.job.jobSkill!.toString().split(',')[index]}');
                                      },
                                    ),
                                  ],
                                )
                              : controller.pageIndex == 1
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Contact Us',
                                          style: TextStyles.TextMMedium,
                                        ),
                                        const Gap(10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.Neutral200,
                                                    width: 1),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Email',
                                                      style: TextStyles
                                                              .TextSReguler
                                                          .copyWith(
                                                        color: AppColors
                                                            .Neutral400,
                                                      ),
                                                    ),
                                                    const Gap(2),
                                                    Text(
                                                        selectedJob
                                                            .job.compEmail!,
                                                        style: TextStyles
                                                            .TextMMedium),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.Neutral200,
                                                    width: 1),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Website',
                                                      style: TextStyles
                                                              .TextSReguler
                                                          .copyWith(
                                                        color: AppColors
                                                            .Neutral400,
                                                      ),
                                                    ),
                                                    const Gap(2),
                                                    Text(
                                                        selectedJob
                                                            .job.compWebsite!,
                                                        style: TextStyles
                                                            .TextMMedium),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(20),
                                        Text(
                                          'About Company',
                                          style:
                                              TextStyles.TextSReguler.copyWith(
                                            color: AppColors.Neutral400,
                                          ),
                                        ),
                                        const Gap(10),
                                        Text(
                                          selectedJob.job.aboutComp!,
                                          style:
                                              TextStyles.TextSReguler.copyWith(
                                            color: AppColors.Neutral600,
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text('6 Employees For',
                                                    style:
                                                        TextStyles.TextMMedium),
                                                const Gap(4),
                                                Text(
                                                  'UI/UX Design',
                                                  style: TextStyles.TextSReguler
                                                      .copyWith(
                                                    color: AppColors.Neutral500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border: Border.all(
                                                      color:
                                                          AppColors.Neutral300,
                                                      width: 1),
                                                ),
                                                child: GetBuilder<
                                                    JobDetailsController>(
                                                  builder: (controller) =>
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton2<String>(
                                                      isExpanded: true,
                                                      hint: Text(
                                                        controller.menuText,
                                                        style: TextStyles
                                                            .TextSReguler,
                                                      ),
                                                      items: controller.items
                                                          .map((String item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                    item,
                                                                    style: TextStyles
                                                                        .TextSReguler),
                                                              ))
                                                          .toList(),
                                                      onChanged:
                                                          (String? value) {
                                                        controller
                                                            .changeMenuText(
                                                                value!);
                                                      },
                                                      buttonStyleData:
                                                          const ButtonStyleData(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 16),
                                                        height: 40,
                                                        width: 180,
                                                      ),
                                                      menuItemStyleData:
                                                          const MenuItemStyleData(
                                                        height: 40,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                        const Gap(20),
                                        ListView.builder(
                                          itemCount:
                                              controller.employees.length,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Image.asset(
                                                    controller.employees[index]
                                                        ['image']!,
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                ),
                                                title: Text(
                                                  controller.employees[index]
                                                      ['name']!,
                                                  style:
                                                      TextStyles.TextMReguler,
                                                ),
                                                subtitle: Text(
                                                  controller.employees[index]
                                                      ['position']!,
                                                  style: TextStyles.TextSReguler
                                                      .copyWith(
                                                    color: AppColors.Neutral500,
                                                  ),
                                                ),
                                                trailing: Column(
                                                  children: [
                                                    Text(
                                                      'Work Duration',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      '${controller.employees[index]['duration']!} years',
                                                      style: TextStyles
                                                          .TextSMedium.copyWith(
                                                        color: AppColors
                                                            .Primary500,
                                                      ),
                                                    ),
                                                  ],
                                                ));
                                          },
                                        )
                                      ],
                                    ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            )));
  }
}
