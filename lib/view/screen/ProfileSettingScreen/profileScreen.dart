import 'package:flutter/material.dart';
import 'package:amira810am/controller/profileScreenController.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreenController profController =
      Get.put<ProfileScreenController>(ProfileScreenController());
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    profController.getPortfolio();
    final w = Get.width;
    final h = Get.height;
    return Scaffold(
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
        currentIndex: 4,
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
        // ),
        selectedItemColor: AppColors.Primary500,
        onTap: (index) {
          index == 0
              ? Get.toNamed(MyRoutes.HomeScreen)
              : index == 1
                  ? Get.toNamed(MyRoutes.MessageScreen)
                  : index == 2
                      ? Get.toNamed(MyRoutes.AppliedJob)
                      : index == 3
                          ? Get.toNamed(MyRoutes.SavedJobScreen)
                          : null;
        },
      ),
      body: GetBuilder<ProfileScreenController>(
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      color: AppColors.Primary100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                )),
                            Text('Profile', style: TextStyles.Heading4Medium),
                            IconButton(
                                onPressed: () {
                                  GetStorage().erase();
                                  Get.offAllNamed(MyRoutes.Login);
                                },
                                icon: const Icon(
                                  Icons.logout_outlined,
                                  size: 24,
                                  color: AppColors.Danger500,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            color: AppColors.Primary100,
                            width: double.infinity,
                            height: h * 0.18,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: h * 0.1, left: (w / 2) - 60),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.White,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(AssetsData.Profile22),
                            radius: 60,
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),
                    Text(
                      profController.gusData.data!.profile!.name ??
                          '** no name',
                      style: TextStyles.Heading4Medium,
                    ),
                    const Gap(4),
                    Text("Senior UI/UX Designer",
                        style: TextStyles.TextMReguler.copyWith(
                            color: AppColors.Neutral500)),
                    const Gap(24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.White,
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, right: 3, left: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Applied',
                                    style: TextStyles.TextMMedium.copyWith(
                                        color: AppColors.Neutral500),
                                  ),
                                  const Gap(8),
                                  Text('46', style: TextStyles.Heading4Medium)
                                ],
                              ),
                              const Gap(12),
                              const VerticalDivider(
                                  width: 5,
                                  color: AppColors.Neutral300,
                                  thickness: 20,
                                  endIndent: 0,
                                  indent: 20),
                              const Gap(12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Reviewed',
                                    style: TextStyles.TextMMedium.copyWith(
                                        color: AppColors.Neutral500),
                                  ),
                                  const Gap(8),
                                  Text('23', style: TextStyles.Heading4Medium)
                                ],
                              ),
                              const Gap(12),
                              const VerticalDivider(
                                  width: 5,
                                  color: AppColors.Neutral300,
                                  thickness: 20,
                                  endIndent: 0,
                                  indent: 20),
                              const Gap(12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Contacted',
                                    style: TextStyles.TextMMedium.copyWith(
                                        color: AppColors.Neutral500),
                                  ),
                                  const Gap(8),
                                  Text('16', style: TextStyles.Heading4Medium)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'About',
                                style: TextStyles.TextLMedium.copyWith(
                                    color: AppColors.Neutral500),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.toNamed(MyRoutes.EditLanguageScreen);
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyles.TextMMedium.copyWith(
                                        color: AppColors.Primary500),
                                  ))
                            ],
                          ),
                          Text(
                              profController.gusData.data!.profile?.bio ??
                                  '** no Bio',
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.TextMMedium.copyWith(
                                  color: AppColors.Neutral500)),
                        ],
                      ),
                    ),
                    const Gap(36),
                    Container(
                      height: 36,
                      width: double.infinity,
                      color: AppColors.Neutral200,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 8, bottom: 8),
                        child: Text("General",
                            style: TextStyles.TextMMedium.copyWith(
                                color: AppColors.Neutral500)),
                      ),
                    ),
                    const Gap(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: profController.generalSettings.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                profController.onclickGotoPAge(
                                    title: profController.generalSettings[index]
                                        ['title']);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.Primary100,
                                        radius: 25,
                                        child: Icon(
                                            profController
                                                .generalSettings[index]['icon'],
                                            size: 20,
                                            color: AppColors.Primary500),
                                      ),
                                      const Gap(12),
                                      Text(
                                          profController.generalSettings[index]
                                              ['title'],
                                          style: TextStyles.TextLReguler),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                      ))
                                ],
                              ),
                            ),
                            const Divider(
                              height: 30,
                              thickness: 2,
                              color: AppColors.Neutral200,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(32),
                    Container(
                      height: 36,
                      width: double.infinity,
                      color: AppColors.Neutral200,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 8, bottom: 8),
                        child: Text("Others",
                            style: TextStyles.TextMMedium.copyWith(
                                color: AppColors.Neutral500)),
                      ),
                    ),
                    const Gap(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: profController.otherSettings.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                profController.onclickGotoPAge(
                                    title: profController.otherSettings[index]);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(profController.otherSettings[index],
                                      style: TextStyles.TextLReguler),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                      ))
                                ],
                              ),
                            ),
                            const Divider(
                              height: 30,
                              thickness: 2,
                              color: AppColors.Neutral200,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(40),
                  ]),
                ),
              ),
      ),
    );
  }
}
