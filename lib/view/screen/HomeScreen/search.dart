import 'package:flutter/material.dart';
import 'package:amira810am/controller/searchController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:amira810am/view/widget/searchScreenBase.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTxtController = TextEditingController();
    SearchScreenController controller = Get.put(SearchScreenController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                    Expanded(
                      child: TextField(
                        controller: searchTxtController,
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                        autofocus: true,
                        onEditingComplete: () {
                          controller.addRecentSearch(searchTxtController.text);
                          Get.toNamed(MyRoutes.SearchResult, arguments: {
                            'searchTxt': searchTxtController.text
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
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
              const Gap(22),
              Container(
                height: 36,
                width: double.infinity,
                color: AppColors.Neutral200,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 8, bottom: 8),
                  child: Text("Recent searches",
                      style: TextStyles.TextMMedium.copyWith(
                          color: AppColors.Neutral500)),
                ),
              ),
              const Gap(20),
              GetBuilder<SearchScreenController>(
                init: SearchScreenController(),
                builder: (controller) => ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: SearchScreenBase.recentJobs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.history),
                              const Gap(8),
                              TextButton(
                                onPressed: () {
                                  controller.addRecentSearch(
                                      SearchScreenBase.recentJobs[index]);
                                  Get.toNamed(MyRoutes.SearchResult,
                                      arguments: {
                                        'searchTxt':
                                            SearchScreenBase.recentJobs[index]
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                ),
                                child: Text(
                                  SearchScreenBase.recentJobs[index],
                                  style: TextStyles.TextMReguler,
                                ),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                controller.removeRecentSearch(index);
                              },
                              icon: const Icon(Icons.highlight_remove,
                                  color: AppColors.Danger500)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Gap(20),
              Container(
                height: 36,
                width: double.infinity,
                color: AppColors.Neutral200,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 8, bottom: 8),
                  child: Text("Popular searches",
                      style: TextStyles.TextMMedium.copyWith(
                          color: AppColors.Neutral500)),
                ),
              ),
              const Gap(20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: SearchScreenBase.popularJobs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.manage_search),
                            const Gap(8),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(MyRoutes.SearchResult, arguments: {
                                  'searchTxt':
                                      SearchScreenBase.popularJobs[index]
                                });
                              },
                              child: Text(
                                SearchScreenBase.popularJobs[index],
                                style: TextStyles.TextMReguler,
                              ),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: AppColors.Primary500,
                            )),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
