import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:amira810am/controller/homescreencontroller.dart';
import 'package:amira810am/controller/datacrosspagescontroller.dart';
import 'package:amira810am/controller/jobapplycompletecontroller.dart';
import 'package:amira810am/controller/showSavedJobsController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/widget/homescreenbase.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  final h = Get.height;
  final w = Get.width;

  ShowSavedJobsController ssjc =
      Get.put<ShowSavedJobsController>(ShowSavedJobsController());
  HomeScreenController homeController =
      Get.put<HomeScreenController>(HomeScreenController());
  DataCrossPages selectedJob = Get.put<DataCrossPages>(DataCrossPages());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    homeController.onInitFunc();
    ssjc.getSavedJob();

    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
          resizeToAvoidBottomInset: false,
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
            unselectedLabelStyle: TextStyles.MediumReguler,
            selectedLabelStyle:
                TextStyles.MediumReguler.copyWith(color: AppColors.Primary500),
            selectedItemColor: AppColors.Primary500,
            onTap: (index) {
              index == 1
                  ? Get.toNamed(MyRoutes.MessageScreen)
                  : index == 2
                      ? Get.toNamed(MyRoutes.AppliedJob)
                      : index == 3
                          ? Get.toNamed(MyRoutes.SavedJobScreen)
                          : index == 4
                              ? Get.toNamed(MyRoutes.profileScreen)
                              : null;
            },
          ),
          body: controller.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 24, right: 24),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Hi, ${GetStorage().read('name').toString().toUpperCase()} 👋",
                                  style: TextStyles.Heading3Medium),
                              const Gap(8),
                              Text('Create a better future for yourself here',
                                  style: TextStyles.TextMMedium.copyWith(
                                      color: AppColors.Neutral500))
                            ],
                          ),
                          const Gap(38),
                          IconButton(
                              onPressed: () {
                                Get.toNamed(MyRoutes.Notification);
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: AppColors.Neutral300,
                                        width: 1,
                                      )),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child:
                                        Icon(Icons.notifications_none_outlined),
                                  )))
                        ],
                      ),
                      const Gap(28),
                      TextField(
                        onTap: () {
                          Get.toNamed(MyRoutes.SearchScreen);
                        },
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          hintText: 'Search....',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: false,
                          fillColor: AppColors.Black1,
                        ),
                      ),
                      const Gap(28),
                      GetBuilder<JobApplyCompleteController>(
                        init: JobApplyCompleteController(),
                        builder: (controller) => controller.isApplyed
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.Neutral100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        selectedJob.job.image!,
                                        height: 50,
                                      ),
                                      const Gap(10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(selectedJob.job.name!,
                                                textAlign: TextAlign.left,
                                                style:
                                                    TextStyles.Heading5Medium),
                                            Text(
                                              controller.isReplaid
                                                  ? 'You have been accepted for the selection interview'
                                                  : 'Waiting to be selected by the twitter team',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black54,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Gap(10),
                                      InkWell(
                                        onTap: () {
                                          !controller.isReplaid
                                              ? Get.toNamed(MyRoutes.ChatScreen,
                                                  arguments: {
                                                      'image': selectedJob
                                                          .job.image!,
                                                      'name':
                                                          selectedJob.job.name,
                                                    })
                                              : null;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: controller.isReplaid
                                                ? AppColors.Success200
                                                : AppColors.Primary100,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              controller.isReplaid
                                                  ? 'Accepted'
                                                  : 'Submited',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: controller.isReplaid
                                                    ? AppColors.Success500
                                                    : AppColors.Primary500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : const Gap(20),
                      ),
                      const Gap(20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Suggested Job",
                                style: TextStyles.Heading5Medium),
                            Text("View all",
                                style: TextStyles.TextMMedium.copyWith(
                                    color: AppColors.Primary500)),
                          ]),
                      const Gap(20),
                      CarouselSlider.builder(
                        itemCount: controller.jl.data!.length,
                        options: CarouselOptions(
                          height: 183,
                          viewportFraction: 0.85,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          onPageChanged: (indexx, reason) {
                            controller.pageChanged(indexx);
                          },
                          disableCenter: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            InkWell(
                          onTap: () {
                            selectedJob.job = controller.jl.data![itemIndex];
                            Get.toNamed(MyRoutes.JobDetails);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: controller.currentPage == itemIndex
                                  ? AppColors.Primary900
                                  : AppColors.Neutral100,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(children: [
                                      Column(children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                controller
                                                    .jl.data![itemIndex].image!,
                                                height: 50,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 190,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    controller.jl
                                                        .data![itemIndex].name!,
                                                    softWrap: true,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.White,
                                                    ),
                                                  ),
                                                  Text(
                                                    controller
                                                        .jl
                                                        .data![itemIndex]
                                                        .compName!,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                          AppColors.Neutral100,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                      GetBuilder<DataCrossPages>(
                                        builder: (controller) => IconButton(
                                          icon: Icon(
                                              ssjc.showSavedJobs.data != null
                                                  ? ssjc.showSavedJobs.data!
                                                          .any((element) =>
                                                              element.jobId ==
                                                              homeController
                                                                  .jl
                                                                  .data![
                                                                      itemIndex]
                                                                  .id)
                                                      ? Icons.bookmarks
                                                      : Icons.bookmarks_outlined
                                                  : Icons.bookmarks_outlined,
                                              color: AppColors.Primary500),
                                          onPressed: () async {
                                            // ignore: curly_braces_in_flow_control_structures
                                            if (ssjc.showSavedJobs.data != null) if (!ssjc
                                                .showSavedJobs.data!
                                                .any((element) =>
                                                    element.jobId ==
                                                    homeController.jl
                                                        .data![itemIndex].id)) {
                                              await ssjc.saveJob(
                                                  JobId: homeController
                                                      .jl.data![itemIndex].id
                                                      .toString(),
                                                  location: ' ');
                                            } else {
                                              await ssjc.delFavJob(
                                                  id: ssjc
                                                      .showSavedJobs
                                                      .data![ssjc
                                                          .showSavedJobs.data!
                                                          .indexWhere((element) =>
                                                              element.jobId ==
                                                              homeController
                                                                  .jl
                                                                  .data![
                                                                      itemIndex]
                                                                  .id)]
                                                      .id
                                                      .toString(),
                                                  jobId: '');
                                            }
                                            await ssjc.saveJob(
                                                JobId: homeController
                                                    .jl.data![itemIndex].id
                                                    .toString(),
                                                location: ' ');

                                            controller.update();
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FilterChipWidget(controller.jl
                                              .data![itemIndex].jobTimeType!),
                                          FilterChipWidget(itemIndex % 2 == 0
                                              ? 'Remote'
                                              : 'On Set'),
                                          FilterChipWidget(controller
                                              .jl.data![itemIndex].jobType!),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                  text:
                                                      "${controller.jl.data![itemIndex].salary!.substring(0, controller.jl.data![itemIndex].salary!.length - 3)}K EGP",
                                                  style: TextStyles
                                                          .Heading4Medium
                                                      .copyWith(
                                                          color:
                                                              AppColors.White),
                                                  children: [
                                                    TextSpan(
                                                        text: "/Month",
                                                        style: TextStyles
                                                                .TextSMedium
                                                            .copyWith(
                                                                color: AppColors
                                                                    .Neutral400)),
                                                  ]),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.Primary500,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: Text(
                                                  'Apply now',
                                                  style: TextStyles.TextSMedium
                                                      .copyWith(
                                                          color:
                                                              AppColors.White),
                                                ),
                                              ),
                                            ),
                                            const Gap(20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Recent Job',
                                                    style: TextStyles
                                                        .Heading5Medium),
                                                Text('View all',
                                                    style: TextStyles
                                                            .TextMMedium
                                                        .copyWith(
                                                            color: AppColors
                                                                .Primary500)),
                                              ],
                                            ),
                                            const Gap(20),
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount:
                                                    controller.jl.data!.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder:
                                                    (BuildContext context,
                                                            int index) =>
                                                        InkWell(
                                                  onTap: () {
                                                    selectedJob.job = controller
                                                        .jl.data![index];
                                                    Get.toNamed(
                                                        MyRoutes.JobDetails);
                                                  },
                                                  child: Column(children: [
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color:
                                                              AppColors.White,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                              child: Image.network(
                                                                                controller.jl.data![index].image!,
                                                                                height: 70,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: SizedBox(
                                                                                width: 200,
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(controller.jl.data![index].name!, style: TextStyles.Heading3Medium),
                                                                                    Text(controller.jl.data![index].compName!, style: TextStyles.Heading3Medium),
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
                                                                        (controller) =>
                                                                            IconButton(
                                                                      icon:
                                                                          Icon(
                                                                        ssjc.showSavedJobs.data !=
                                                                                null
                                                                            ? ssjc.showSavedJobs.data!.any((element) => element.jobId == homeController.jl.data![index].id)
                                                                                ? Icons.bookmarks
                                                                                : Icons.bookmarks_outlined
                                                                            : Icons.bookmarks_outlined,
                                                                        color: AppColors
                                                                            .Primary500,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        // ignore: curly_braces_in_flow_control_structures
                                                                        if (ssjc.showSavedJobs.data != null) if (!ssjc
                                                                            .showSavedJobs
                                                                            .data!
                                                                            .any((element) =>
                                                                                element.jobId ==
                                                                                homeController.jl.data![index].id)) {
                                                                          await ssjc.saveJob(
                                                                              JobId: homeController.jl.data![index].id.toString(),
                                                                              location: ' ');
                                                                        } else {
                                                                          await ssjc.delFavJob(
                                                                              id: ssjc.showSavedJobs.data![ssjc.showSavedJobs.data!.indexWhere((element) => element.jobId == homeController.jl.data![index].id)].id.toString(),
                                                                              jobId: '');
                                                                        }
                                                                        await ssjc.saveJob(
                                                                            JobId:
                                                                                homeController.jl.data![index].id.toString(),
                                                                            location: ' ');

                                                                        controller
                                                                            .update();
                                                                      },
                                                                    ),
                                                                  ),
                                                                ]),
                                                            const Gap(
                                                              20,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                FilterChipWidget2(
                                                                    controller
                                                                        .jl
                                                                        .data![
                                                                            index]
                                                                        .jobTimeType!),
                                                                FilterChipWidget2(
                                                                    index % 2 ==
                                                                            0
                                                                        ? 'Remote'
                                                                        : 'On Set'),
                                                                FilterChipWidget2(
                                                                    controller
                                                                        .jl
                                                                        .data![
                                                                            index]
                                                                        .jobType!),
                                                                RichText(
                                                                  text: TextSpan(
                                                                      text:
                                                                          "${controller.jl.data![index].salary!.substring(0, controller.jl.data![index].salary!.length - 3)}K EGP",
                                                                      style: TextStyles
                                                                              .TextLMedium
                                                                          .copyWith(
                                                                              color: AppColors.Success700),
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              "/Month",
                                                                          style:
                                                                              TextStyles.TextSMedium.copyWith(color: AppColors.Neutral500),
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                    const Gap(20),
                                                    index !=
                                                            controller.jl.data!
                                                                    .length -
                                                                1
                                                        ? const Divider(
                                                            color: AppColors
                                                                .Neutral200,
                                                            height: 2,
                                                            thickness: 2,
                                                            indent: 5,
                                                            endIndent: 5,
                                                          )
                                                        : const Gap(20),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ]),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                )),
    );
  }
}
