import 'package:flutter/material.dart';
import 'package:amira810am/controller/datacrosspagescontroller.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../core/Routes/myRouts.dart';
import '../../../core/utils/assetsdata.dart';
import '../../../shared/styles/colors/colors.dart';
import '../../../shared/styles/styels/textstyle.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    DataCrossPages selectedJob = Get.find();
    // HomeScreenController hsc = Get.find();
    double h = Get.height;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Saved',
            style: TextStyles.Heading4Medium,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          if (selectedJob.isSaved.isEmpty)
            const SizedBox()
          else
            Container(
              height: 36,
              width: double.infinity,
              color: AppColors.Neutral100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.Neutral200)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GetBuilder<DataCrossPages>(
                  builder: (controller) => Text(
                    '${selectedJob.isSaved.length}Job Saved',
                    style: TextStyles.TextMMedium.copyWith(
                      color: AppColors.Neutral500,
                    ),
                  ),
                ),
              ),
            ),
          const Gap(25),
          Expanded(
              child: GetBuilder<DataCrossPages>(
            builder: (controller) => selectedJob.isSaved.isNotEmpty
                ? ListView.builder(
                    itemCount: selectedJob.isSaved.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: !selectedJob.isSaved
                                .contains(hsc.jl.data![index].id.toString())
                            ? Text(
                                'No Saved Jobs',
                                style: TextStyles.TextMMedium.copyWith(
                                  color: AppColors.Neutral500,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          hsc.jl.data![index].image!,
                                          width: 40,
                                          height: 40,
                                        ),
                                        const Gap(16),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(hsc.jl.data![index].name!,
                                                  style: TextStyles
                                                      .Heading5Medium),
                                              const Gap(4),
                                              Text(
                                                "${hsc.jl.data![index].compName!} • ${hsc.jl.data![index].location.toString().split(', ')[hsc.jl.data![index].location.toString().split(', ').length - 2]} ${hsc.jl.data![index].location.toString().split(', ').last}",
                                                style: TextStyles.TextSReguler
                                                    .copyWith(
                                                  color: AppColors.Neutral700,
                                                ),
                                              ),
                                            ]),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.more_horiz,
                                            color: AppColors.Black1,
                                          ),
                                          onPressed: () {
                                            Get.bottomSheet(
                                              Container(
                                                height: h * 0.3,
                                                color: AppColors.White,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 24,
                                                          left: 24,
                                                          top: 36,
                                                          bottom: 64),
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          selectedJob.job = hsc
                                                              .jl.data![index];
                                                          Get.toNamed(MyRoutes
                                                              .JobApply);
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .Neutral300,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .work_outline_rounded,
                                                                      size: 20,
                                                                      color: AppColors
                                                                          .Neutral900,
                                                                    ),
                                                                    Text(
                                                                        ' Apply Job',
                                                                        style: TextStyles
                                                                            .TextLMedium),
                                                                  ],
                                                                ),
                                                                const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios_outlined,
                                                                  size: 20,
                                                                  color: AppColors
                                                                      .Neutral900,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .Neutral300,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .share_outlined,
                                                                      size: 20,
                                                                      color: AppColors
                                                                          .Neutral900,
                                                                    ),
                                                                    Text(
                                                                        ' Share Via',
                                                                        style: TextStyles
                                                                            .TextLMedium),
                                                                  ],
                                                                ),
                                                                const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios_outlined,
                                                                  size: 20,
                                                                  color: AppColors
                                                                      .Neutral900,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          selectedJob.isSaved
                                                              .remove(hsc
                                                                  .jl
                                                                  .data![index]
                                                                  .id
                                                                  .toString());
                                                          Get.back();
                                                          selectedJob.update();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .Neutral300,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .bookmark_border_outlined,
                                                                      size: 20,
                                                                      color: AppColors
                                                                          .Neutral900,
                                                                    ),
                                                                    Text(
                                                                        ' Share Via',
                                                                        style: TextStyles
                                                                            .TextLMedium),
                                                                  ],
                                                                ),
                                                                const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios_outlined,
                                                                  size: 20,
                                                                  color: AppColors
                                                                      .Neutral900,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    const Gap(16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Posted 2 days ago ',
                                          style:
                                              TextStyles.TextSReguler.copyWith(
                                            color: AppColors.Neutral700,
                                          ),
                                        ),
                                        const Gap(20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Icon(
                                              Icons.schedule,
                                              size: 20,
                                              color: AppColors.Success700,
                                            ),
                                            const Gap(6),
                                            Text(
                                              'Be an early applicant',
                                              style: TextStyles.TextSReguler
                                                  .copyWith(
                                                color: AppColors.Neutral700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Gap(16),
                                    index != selectedJob.isSaved.length - 1
                                        ? const Divider(
                                            color: AppColors.Neutral200,
                                            thickness: 1,
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AssetsData.Savedilustration,
                          ),
                          const Gap(24),
                          Text(
                            'Nothing has been saved yet',
                            style: TextStyles.Heading3Medium,
                          ),
                          const Gap(8),
                          Text(
                            'Press the star icon on the job you want to save.',
                            style: TextStyles.TextLReguler.copyWith(
                                color: AppColors.Neutral500),
                          ),
                        ]),
                  ),
          )),
        ],
      ),
    );
  }
}
