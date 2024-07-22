// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:amira810am/controller/appliedjobcontroller.dart';
import 'package:amira810am/controller/datacrosspagescontroller.dart';
import 'package:amira810am/controller/homescreencontroller.dart';
import 'package:amira810am/controller/showSavedJobsController.dart';

import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';

import 'package:amira810am/view/widget/homescreenbase.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppliedJobScreen extends StatelessWidget {
  AppliedJobScreen({super.key});
  ShowSavedJobsController ssjc =
      Get.put<ShowSavedJobsController>(ShowSavedJobsController());
  AppliedJobController jobController = Get.put(AppliedJobController());
  DataCrossPages selectedJob = Get.put(DataCrossPages());
  HomeScreenController homeController =
      Get.put<HomeScreenController>(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    // final w = Get.width;
    // final h = Get.height;
    jobController.getAppliedJob();

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Applied Job',
            style: TextStyles.Heading4Medium,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: AppColors.Neutral900,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline_outlined,
            ),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        showUnselectedLabels: true,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        unselectedItemColor: AppColors.Neutral400,
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.Neutral400,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.Primary500,
        ),
        selectedItemColor: AppColors.Primary500,
        onTap: (index) {
          index == 0
              ? Get.toNamed(MyRoutes.HomeScreen)
              : index == 1
                  ? Get.toNamed(MyRoutes.MessageScreen)
                  : index == 3
                      ? Get.toNamed(MyRoutes.SavedJobScreen)
                      : index == 4
                          ? Get.toNamed(MyRoutes.profileScreen)
                          : null;
        },
      ),
      body: !jobController.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(24),
                      ToggleSwitch(
                        minWidth: 160,
                        cornerRadius: 50.0,
                        activeBgColors: const [
                          [AppColors.Primary900],
                          [AppColors.Primary900]
                        ],
                        activeFgColor: AppColors.White,
                        inactiveBgColor: AppColors.Neutral100,
                        inactiveFgColor: AppColors.Neutral500,
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: const ['Active', 'Rejected'],
                        radiusStyle: true,
                        onToggle: (index) {
                          jobController.changeJobStatus(index!);
                        },
                      ),
                      const Gap(24),
                      GetBuilder<AppliedJobController>(
                        builder: (controller) => controller.activeJob == 0
                            ? Column(children: [
                                Container(
                                  width: double.infinity,
                                  color: AppColors.Neutral200,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 8),
                                    child: Text(
                                      ' 3 Jobs',
                                      style: TextStyles.TextMMedium.copyWith(
                                        color: AppColors.Neutral500,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        selectedJob.job =
                                            homeController.jl.data![index];
                                        Get.toNamed(MyRoutes.ReApplyJob);
                                      },
                                      child: Column(children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.Neutral300,
                                          ),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(children: [
                                                        Row(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              child:
                                                                  Image.network(
                                                                homeController
                                                                    .jl
                                                                    .data![
                                                                        index]
                                                                    .image!,
                                                                height: 70,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                              child: SizedBox(
                                                                width: 200,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        homeController
                                                                            .jl
                                                                            .data![
                                                                                index]
                                                                            .name!,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: TextStyles
                                                                            .Heading5Medium),
                                                                    Text(
                                                                      "${homeController.jl.data![index].compName!} • ${homeController.jl.data![index].location!.split(', ')[homeController.jl.data![index].location!.split(', ').length - 2]}, ${homeController.jl.data![index].location!.split(', ')[homeController.jl.data![index].location!.split(', ').length - 3]}",
                                                                      style: TextStyles
                                                                              .TextSReguler
                                                                          .copyWith(
                                                                              color: AppColors.Neutral500),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ]),
                                                      GetBuilder<
                                                          DataCrossPages>(
                                                        builder:
                                                            (selectedJob) =>
                                                                IconButton(
                                                          icon: Icon(
                                                            ssjc.showSavedJobs
                                                                        .data !=
                                                                    null
                                                                ? ssjc.showSavedJobs.data!.any((element) =>
                                                                        element
                                                                            .jobId ==
                                                                        homeController
                                                                            .jl
                                                                            .data![
                                                                                index]
                                                                            .id)
                                                                    ? Icons
                                                                        .bookmarks
                                                                    : Icons
                                                                        .bookmarks_outlined
                                                                : Icons
                                                                    .bookmarks_outlined,
                                                            color: AppColors
                                                                .Primary500,
                                                          ),
                                                          onPressed: () async {
                                                            if (ssjc.showSavedJobs
                                                                    .data !=
                                                                null)
                                                            // ignore: curly_braces_in_flow_control_structures
                                                            if (!ssjc
                                                                .showSavedJobs
                                                                .data!
                                                                .any((element) =>
                                                                    element
                                                                        .jobId ==
                                                                    homeController
                                                                        .jl
                                                                        .data![
                                                                            index]
                                                                        .id)) {
                                                              await ssjc.saveJob(
                                                                  JobId: homeController
                                                                      .jl
                                                                      .data![
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  location: "");
                                                            } else {
                                                              ssjc
                                                                  .showSavedJobs
                                                                  .data![ssjc
                                                                      .showSavedJobs
                                                                      .data!
                                                                      .indexWhere((element) =>
                                                                          element
                                                                              .jobId ==
                                                                          homeController
                                                                              .jl
                                                                              .data![index]
                                                                              .id)]
                                                                  .id
                                                                  .toString();
                                                            }
                                                            await ssjc.saveJob(
                                                                JobId: homeController
                                                                    .jl
                                                                    .data![
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                location: '');
                                                            selectedJob
                                                                .update();
                                                          },
                                                        ),
                                                      ),
                                                    ]),
                                                const Gap(20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FilterChipWidget2(
                                                              homeController
                                                                  .jl
                                                                  .data![index]
                                                                  .jobTimeType!),
                                                          const Gap(20),
                                                          FilterChipWidget2(
                                                              index % 2 == 0
                                                                  ? "Remote"
                                                                  : "On Site"),
                                                        ]),
                                                    Text(
                                                      'Posted 2 days ago',
                                                      style: TextStyles
                                                              .TextSReguler
                                                          .copyWith(
                                                              color: AppColors
                                                                  .Neutral500),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: AppColors
                                                                .Neutral300),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(children: [
                                                              Container(
                                                                color: index >=
                                                                        0
                                                                    ? AppColors
                                                                        .Primary500
                                                                    : AppColors
                                                                        .Neutral400,
                                                                width: 40,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: index >=
                                                                          0
                                                                      ? AppColors
                                                                          .Primary500
                                                                      : AppColors
                                                                          .Neutral400,
                                                                  border: Border
                                                                      .all(
                                                                    color: index >=
                                                                            0
                                                                        ? AppColors
                                                                            .Primary500
                                                                        : AppColors
                                                                            .Neutral400,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    index > 0
                                                                        ? '✓'
                                                                        : '1',
                                                                    style: TextStyles
                                                                            .TextSReguler
                                                                        .copyWith(
                                                                      color: index >
                                                                              0
                                                                          ? AppColors
                                                                              .Neutral400
                                                                          : index != 0
                                                                              ? AppColors.Primary500
                                                                              : AppColors.Neutral400,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const Gap(9),
                                                              Text('Biodata',
                                                                  style: TextStyles
                                                                          .TextSReguler
                                                                      .copyWith(
                                                                    color: index >=
                                                                            0
                                                                        ? AppColors
                                                                            .Primary500
                                                                        : AppColors
                                                                            .Neutral400,
                                                                  ))
                                                            ]),
                                                            Text('.....',
                                                                style: TextStyles
                                                                        .TextSReguler
                                                                    .copyWith(
                                                                  color: index >=
                                                                          1
                                                                      ? AppColors
                                                                          .Primary500
                                                                      : AppColors
                                                                          .Neutral400,
                                                                )),
                                                            Column(children: [
                                                              Container(
                                                                  color: index >=
                                                                          0
                                                                      ? AppColors
                                                                          .Primary500
                                                                      : AppColors
                                                                          .Neutral400,
                                                                  width: 40,
                                                                  height: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: index >=
                                                                            1
                                                                        ? AppColors
                                                                            .Primary500
                                                                        : AppColors
                                                                            .Neutral900,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: index >= 1
                                                                          ? AppColors
                                                                              .Primary500
                                                                          : AppColors
                                                                              .Neutral400,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                  ),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    index > 0
                                                                        ? '✓'
                                                                        : '2',
                                                                    style: TextStyles
                                                                            .TextSReguler
                                                                        .copyWith(
                                                                      color: index >
                                                                              0
                                                                          ? AppColors
                                                                              .Neutral400
                                                                          : index != 0
                                                                              ? AppColors.White
                                                                              : AppColors.Neutral400,
                                                                    ),
                                                                  ))),
                                                              const Gap(9),
                                                              Text(
                                                                  'Type of work',
                                                                  style: TextStyles.TextSReguler.copyWith(
                                                                      color: index < 1
                                                                          ? AppColors
                                                                              .Neutral400
                                                                          : AppColors
                                                                              .Primary500)),
                                                            ]),
                                                            Text('.....',
                                                                style: TextStyles
                                                                        .TextSReguler
                                                                    .copyWith(
                                                                  color: index >=
                                                                          2
                                                                      ? AppColors
                                                                          .Primary500
                                                                      : AppColors
                                                                          .Neutral400,
                                                                )),
                                                            Column(children: [
                                                              Container(
                                                                  width: 40,
                                                                  height: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: index >=
                                                                            1
                                                                        ? AppColors
                                                                            .Primary500
                                                                        : AppColors
                                                                            .Neutral900,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: index >= 1
                                                                          ? AppColors
                                                                              .Primary500
                                                                          : AppColors
                                                                              .Neutral400,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                  ),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    index > 0
                                                                        ? '✓'
                                                                        : '3',
                                                                    style: TextStyles
                                                                            .TextSReguler
                                                                        .copyWith(
                                                                      color: index >
                                                                              0
                                                                          ? AppColors
                                                                              .Neutral400
                                                                          : index != 0
                                                                              ? AppColors.White
                                                                              : AppColors.Neutral400,
                                                                    ),
                                                                  ))),
                                                              const Gap(9),
                                                              Text(
                                                                  'Upload portfolio',
                                                                  style: TextStyles.TextSReguler.copyWith(
                                                                      color: index < 1
                                                                          ? AppColors
                                                                              .Neutral400
                                                                          : AppColors
                                                                              .Primary500)),
                                                            ]),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const Gap(20),
                                                    index !=
                                                            homeController
                                                                    .jl
                                                                    .data!
                                                                    .length -
                                                                1
                                                        ? const Divider(
                                                            color: AppColors
                                                                .Neutral200,
                                                            height: 2,
                                                            thickness: 2,
                                                            //                                 indent: 5,
                                                            //                                 endIndent: 5,
                                                          )
                                                        : const Gap(10),
                                                    const Gap(20),
                                                  ],
                                                ),
                                              ]),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              ])
                            : Center(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Gap(87),
                                      Image.asset(
                                        AssetsData.Datailustration,
                                      ),
                                      const Gap(24),
                                      Text('No applications were rejected',
                                          style: TextStyles.Heading3Medium),
                                      const Gap(12),
                                      Text(
                                          "If there is an application that is rejected by the\ncompany it will appear here",
                                          style:
                                              TextStyles.TextLReguler.copyWith(
                                                  color: AppColors.Neutral500)),
                                    ]),
                              ),
                      ),
                    ]),
              ),
            ),
    );
  }
}
