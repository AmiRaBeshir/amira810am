import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:flutter/material.dart';
import 'package:amira810am/controller/messagecontroller.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../shared/styles/colors/colors.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final MessageController messageController =
      Get.put<MessageController>(MessageController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.Black1,
            )),
        automaticallyImplyLeading: false,
        title: Text('Messsages', style: TextStyles.Heading4Medium),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
        currentIndex: 1,
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
              : index == 2
                  ? Get.toNamed(MyRoutes.AppliedJob)
                  : index == 3
                      ? Get.toNamed(MyRoutes.SavedJobScreen)
                      : index == 4
                          ? Get.toNamed(MyRoutes.profileScreen)
                          : null;
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search messages....',
                  ),
                ),
                const Gap(12),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColors.Neutral300),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.bottomSheet(Container(
                        height: 0.4 * height,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                          ),
                          color: AppColors.White,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 36),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Message filters',
                                  style: TextStyles.Heading5Medium),
                              const Gap(16),
                              InkWell(
                                onTap: () {
                                  messageController
                                      .changeUnRead(!messageController.unRead);
                                  Get.back();
                                },
                                child: Container(
                                  width: 327,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.Neutral300),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 24, left: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Unread',
                                          style:
                                              TextStyles.TextLMedium.copyWith(
                                                  color: AppColors.Neutral700),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: AppColors.Neutral900,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(16),
                              InkWell(
                                onTap: () {
                                  messageController
                                      .changeUnRead(!messageController.unRead);
                                  Get.back();
                                },
                                child: Container(
                                  width: 327,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.Neutral300),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 24, left: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Archived',
                                          style:
                                              TextStyles.TextLMedium.copyWith(
                                                  color: AppColors.Neutral700),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: AppColors.Neutral900,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                    icon: const Icon(Icons.tune),
                  ),
                )
              ],
            ),
            const Gap(28),
            messageController.message.isNotEmpty
                ? GetBuilder<MessageController>(
                    builder: (controller) => Column(
                      children: [
                        controller.unRead == true
                            ? Container(
                                color: AppColors.Neutral100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.Neutral200)),
                                width: double.infinity,
                                height: 36,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Unread',
                                      style: TextStyles.TextMMedium.copyWith(
                                          color: AppColors.Neutral500),
                                    ),
                                    InkWell(
                                        onTap: () => controller
                                            .changeUnRead(!controller.unRead),
                                        child: Text(
                                          'Read all messages',
                                          style:
                                              TextStyles.TextMMedium.copyWith(
                                                  color: AppColors.Primary500),
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        const Gap(16),
                        controller.unRead == false
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.message.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(0.02 * width),
                                  child: InkWell(
                                    onTap: () => Get.toNamed(
                                        MyRoutes.ChatScreen,
                                        arguments: {
                                          'image': controller.message[index]
                                              ['image'],
                                          'name': controller.message[index]
                                              ['name'],
                                        }),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Image.asset(
                                              controller.message[index]
                                                  ['image'],
                                            ),
                                            controller.message[index]['read'] ==
                                                    false
                                                ? Container(
                                                    width: 17,
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              AppColors.White,
                                                        ),
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .Primary500),
                                                    child: Center(
                                                        child: Text('1',
                                                            style: TextStyles
                                                                    .TextXSMedium
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .White))),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                        const Gap(16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 267),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      controller.message[index]
                                                          ['name'],
                                                      style: TextStyles
                                                          .TextLMedium),
                                                  Text(
                                                    controller.message[index]
                                                        ['time'],
                                                    style: TextStyle(
                                                        color: controller.message[
                                                                        index]
                                                                    ['read'] ==
                                                                false
                                                            ? AppColors
                                                                .Primary500
                                                            : AppColors
                                                                .Neutral500),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Gap(4),
                                            Text(
                                              controller.message[index]
                                                  ['Content'],
                                              style: TextStyles.TextSReguler
                                                  .copyWith(
                                                color: AppColors.Neutral500,
                                              ),
                                            ),
                                            const Gap(16),
                                            const Divider(
                                              height: 1,
                                              color: AppColors.Neutral200,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.message.length,
                                itemBuilder: (context, index) => controller
                                            .message[index]['read'] ==
                                        false
                                    ? Padding(
                                        padding: EdgeInsets.all(0.02 * width),
                                        child: InkWell(
                                          onTap: () => Get.toNamed(
                                              MyRoutes.ChatScreen,
                                              arguments: {
                                                'image': controller
                                                    .message[index]['image'],
                                                'name': controller
                                                    .message[index]['name'],
                                              }),
                                          child: Row(children: [
                                            Stack(
                                              children: [
                                                Image.asset(
                                                  controller.message[index]
                                                      ['image'],
                                                ),
                                                controller.message[index]
                                                            ['read'] ==
                                                        false
                                                    ? Container(
                                                        width: 17,
                                                        height: 17,
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  width: 1,
                                                                  color:
                                                                      AppColors
                                                                          .White,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .Primary500),
                                                        child: Center(
                                                            child: Text('1',
                                                                style: TextStyles
                                                                        .TextXSMedium
                                                                    .copyWith(
                                                                        color: AppColors
                                                                            .White))),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                            const Gap(16),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 267),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          controller.message[
                                                              index]['name'],
                                                          style: TextStyles
                                                              .TextLMedium),
                                                      Text(
                                                        controller
                                                                .message[index]
                                                            ['time'],
                                                        style: TextStyle(
                                                            color: controller.message[
                                                                            index]
                                                                        [
                                                                        'read'] ==
                                                                    false
                                                                ? AppColors
                                                                    .Primary500
                                                                : AppColors
                                                                    .Neutral500),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Gap(4),
                                                Text(
                                                  controller.message[index]
                                                      ['Content'],
                                                  style: TextStyles.TextSReguler
                                                      .copyWith(
                                                    color: AppColors.Neutral500,
                                                  ),
                                                ),
                                                const Gap(16),
                                                const Divider(
                                                  height: 1,
                                                  color: AppColors.Neutral200,
                                                )
                                              ],
                                            )
                                          ]),
                                        ),
                                      )
                                    : Container(),
                              ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(100),
                      Image.asset(AssetsData.DataIlustration),
                      const Gap(24),
                      Center(
                        child: Text('You have not received any\nmessages',
                            style: TextStyles.Heading3Medium),
                      ),
                      const Gap(12),
                      Text(
                          'Once your application has reached the interview\nstage, you will get a message from the recruiter.',
                          style: TextStyles.TextLReguler.copyWith(
                              color: AppColors.Neutral500)),
                    ],
                  ),
            const Gap(170),
          ],
        ),
      ),
    );
  }
}
