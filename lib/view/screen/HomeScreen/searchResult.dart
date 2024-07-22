import 'package:flutter/material.dart';
import 'package:amira810am/controller/datacrosspagescontroller.dart';
import 'package:amira810am/controller/searchController.dart';
import 'package:amira810am/controller/searchResultController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/componets/button.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/widget/filterchipwidget2.dart';
import 'package:amira810am/view/widget/searchResultBase.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTxtController = TextEditingController();
    TextEditingController nameTxtController = TextEditingController();
    TextEditingController locationTxtController = TextEditingController();
    SearchScreenController SearchController = Get.put(SearchScreenController());
    SearchResultController searchResultController =
        Get.put(SearchResultController());
    DataCrossPages selectedJob = Get.put(DataCrossPages());
    final double h = Get.height;
    final String argu = Get.arguments['searchTxt'] ?? '';
    searchTxtController.text = argu;
    searchResultController.getSearchResult(argu);

    return GetBuilder<SearchResultController>(
      builder: (searchResultController) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: searchResultController.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back)),
                          const Gap(12),
                          Expanded(
                            child: TextField(
                              controller: searchTxtController,
                              style: TextStyles.bodyMediumMedium,
                              onEditingComplete: () {
                                SearchController.addRecentSearch(
                                    searchTxtController.text);
                                searchResultController
                                    .getSearchResult(searchTxtController.text);
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    searchTxtController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.highlight_remove_outlined,
                                    size: 24,
                                  ),
                                ),
                                hintText: "Type something... ",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.bottomSheet(
                                    isScrollControlled: true,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    backgroundColor: AppColors.White,
                                    SizedBox(
                                      height: h * 0.8,
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, right: 40, top: 24),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      icon: const Icon(
                                                        Icons.arrow_back,
                                                        size: 24,
                                                      )),
                                                  Text("Set Filter",
                                                      style: TextStyles
                                                          .Heading4Medium),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Reset",
                                                      style: TextStyles
                                                              .TextLMedium
                                                          .copyWith(
                                                              color: AppColors
                                                                  .Primary500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Gap(20),
                                              Text("Job Title",
                                                  style:
                                                      TextStyles.TextLMedium),
                                              const Gap(8),
                                              TextField(
                                                controller: nameTxtController,
                                                decoration: InputDecoration(
                                                  prefixIcon: const Icon(
                                                    Icons.shopping_bag_outlined,
                                                  ),
                                                  hintText: "jop Title... ",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                              const Gap(20),
                                              Text("Location",
                                                  style:
                                                      TextStyles.TextLMedium),
                                              const Gap(8),
                                              TextField(
                                                controller:
                                                    locationTxtController,
                                                decoration: InputDecoration(
                                                  prefixIcon: const Icon(
                                                    Icons.location_on_outlined,
                                                  ),
                                                  hintText: "Location... ",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                              const Gap(20),
                                              Text("Salary",
                                                  style:
                                                      TextStyles.TextLMedium),
                                              const Gap(8),
                                              DropdownButtonFormField<String>(
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: '5K - 10K',
                                                    child: Text('5K - 10K'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: '10K - 15K',
                                                    child: Text('10K - 15K'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: '15K - 20K',
                                                    child: Text('15K - 20K'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: '20K - 25K',
                                                    child: Text('20K - 25K'),
                                                  ),
                                                ],
                                                onChanged: (String? value) {},
                                                decoration: InputDecoration(
                                                  prefixIcon: const Icon(Icons
                                                      .monetization_on_outlined),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 10)),
                                                ),
                                              ),
                                              const Gap(20),
                                              Text("Job Type",
                                                  style:
                                                      TextStyles.TextLMedium),
                                              GetBuilder<
                                                      SearchResultController>(
                                                  builder: (controller) =>
                                                      GridView.builder(
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing: 8,
                                                          mainAxisSpacing: 8,
                                                          childAspectRatio: 2,
                                                        ),
                                                        shrinkWrap: true,
                                                        itemCount: controller
                                                            .jobTypeFilterList
                                                            .length,
                                                        itemBuilder: (context,
                                                                index) =>
                                                            FilterChipsJobFilter(
                                                                text: controller
                                                                        .jobTypeFilterList[
                                                                    index],
                                                                index: index),
                                                      )),
                                              const Gap(100),
                                              ElevatedButtoncustom(
                                                onPressed: () {
                                                  Get.back();

                                                  searchResultController
                                                      .getJobFilter(
                                                          name:
                                                              nameTxtController
                                                                  .text,
                                                          location:
                                                              locationTxtController
                                                                  .text);
                                                },
                                                text: "Show Result",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                              icon: const Icon(Icons.tune)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[0],
                                index: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[1],
                                index: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[2],
                                index: 2),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[3],
                                index: 3),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[4],
                                index: 4),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChipsJobFilter(
                                text:
                                    searchResultController.jobTypeFilterList[5],
                                index: 5),
                          ),
                        ],
                      ),
                    ),
                    searchResultController.sr.data!.isNotEmpty
                        ? const Gap(20)
                        : Container(),
                    searchResultController.sr.data!.isNotEmpty
                        ? Container(
                            height: 36,
                            width: double.infinity,
                            color: AppColors.Neutral200,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 8, bottom: 8),
                              child: Text("Featuring 120+ jobs",
                                  style: TextStyles.TextMMedium.copyWith(
                                      color: AppColors.Neutral500)),
                            ),
                          )
                        : Container(),
                    const Gap(10),
                    searchResultController.sr.data!.isNotEmpty
                        ? ListView.builder(
                            itemCount: searchResultController.sr.data!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) =>
                                Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      MyRoutes.JobDetails,
                                    );
                                    selectedJob.job =
                                        searchResultController.sr.data![index];
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.White,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(children: [
                                                  Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: Image.network(
                                                          searchResultController
                                                              .sr
                                                              .data![index]
                                                              .image!,
                                                          height: 70,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: SizedBox(
                                                          width: 200,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  searchResultController
                                                                      .sr
                                                                      .data![
                                                                          index]
                                                                      .name!,
                                                                  style: TextStyles
                                                                      .Heading4Medium),
                                                              Text(
                                                                searchResultController
                                                                    .sr
                                                                    .data![
                                                                        index]
                                                                    .compName!,
                                                                style: TextStyles
                                                                        .TextSReguler
                                                                    .copyWith(
                                                                        color: AppColors
                                                                            .Neutral700),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ]),
                                                GetBuilder<DataCrossPages>(
                                                  builder: (dataCrossPages) =>
                                                      IconButton(
                                                    icon: Icon(
                                                      selectedJob.isSaved
                                                              .contains(
                                                                  selectedJob
                                                                      .job.id
                                                                      .toString())
                                                          ? Icons.bookmarks
                                                          : Icons
                                                              .bookmarks_outlined,
                                                      color:
                                                          AppColors.Primary500,
                                                    ),
                                                    onPressed: () {
                                                      selectedJob
                                                              .isSaved
                                                              .contains(
                                                                  selectedJob
                                                                      .job.id
                                                                      .toString())
                                                          ? selectedJob.isSaved
                                                              .remove(selectedJob
                                                                  .job.id
                                                                  .toString())
                                                          : selectedJob.isSaved
                                                              .add(selectedJob
                                                                  .job.id
                                                                  .toString());
                                                      dataCrossPages.update();
                                                    },
                                                  ),
                                                ),
                                              ]),
                                          const Gap(20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FilterChipWidget2(
                                                  searchResultController
                                                      .sr
                                                      .data![index]
                                                      .jobTimeType!),
                                              FilterChipWidget2(index % 2 == 0
                                                  ? 'Remote'
                                                  : 'On Set'),
                                              FilterChipWidget2(
                                                  searchResultController.sr
                                                      .data![index].jobType!),
                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        "${searchResultController.sr.data![index].salary!.substring(0, searchResultController.sr.data![index].salary!.length - 3)}K EGP",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.Success700,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: "/Month",
                                                        style: TextStyles
                                                                .TextSMedium
                                                            .copyWith(
                                                                color: AppColors
                                                                    .Neutral500),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                                const Gap(20),
                                index !=
                                        searchResultController.sr.data!.length -
                                            1
                                    ? const Divider(
                                        color: AppColors.Neutral200,
                                        height: 2,
                                        thickness: 2,
                                      )
                                    : const SizedBox(
                                        height: 10,
                                      ),
                                const Gap(20),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Gap(20),
                              Image.asset(
                                AssetsData.Searchilustration,
                              ),
                              const Gap(20),
                              Text(
                                'Search not found',
                                style: TextStyles.Heading3Medium,
                              ),
                              const Gap(12),
                              const Text(
                                'Try searching with different keywords so',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 16),
                              ),
                              Text(
                                ' we can show you',
                                style: TextStyles.TextMReguler.copyWith(
                                    color: AppColors.Neutral500),
                              )
                            ],
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
