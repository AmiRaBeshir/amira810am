import 'package:flutter/material.dart';
import 'package:amira810am/controller/chattcontroller.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../shared/styles/colors/colors.dart';
import '../../../shared/styles/styels/textstyle.dart';
import '../../widget/buttonSheetFieldWidget.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController controller = Get.put<ChatController>(ChatController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    dynamic argument = Get.arguments;
    final ChatController controller = Get.put<ChatController>(ChatController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.White,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_rounded)),
                  Image.asset(
                    argument['image'],
                  ),
                  Text(argument['name'], style: TextStyles.TextLMedium),
                ],
              ),
            ),
            InkWell(
                onTap: () {
                  Get.bottomSheet(Container(
                    width: double.infinity,
                    height: height,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: AppColors.White,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buttonSheetField(
                              text: 'Visit job post', icon: Icons.work_outline),
                          buttonSheetField(
                              text: 'View my application',
                              icon: Icons.text_snippet_outlined),
                          buttonSheetField(
                              text: 'Mark as unread', icon: Icons.mail_outline),
                          buttonSheetField(
                              text: 'Mute', icon: Icons.notifications_none),
                          buttonSheetField(
                              text: 'Archive',
                              icon: Icons.file_download_outlined),
                          buttonSheetField(
                              text: 'Delete conversation',
                              icon: Icons.delete_outline),
                        ],
                      ),
                    ),
                  ));
                },
                child: const Icon(
                  Icons.more_horiz_outlined,
                ))
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 113,
                  child: Divider(
                    color: AppColors.Neutral400, // Set the color of the divider
                    height: 1,
                  ),
                ),
                Text(
                  'Today, Nov 13',
                  style: TextStyles.TextSMedium.copyWith(
                      color: AppColors.Neutral400),
                ),
                const SizedBox(
                  width: 113,
                  child: Divider(
                    color: AppColors.Neutral400, // Set the color of the divider
                    height: 1,
                  ),
                ),
              ],
            ),
            const Gap(12),
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.chat.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(0.02 * width),
                      child: Row(
                        mainAxisAlignment: index % 2 == 0
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? AppColors.White
                                  : AppColors.Primary500,
                              borderRadius: index % 2 == 0
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                            ),
                            constraints: BoxConstraints(maxWidth: 0.8 * width),
                            child: Padding(
                              padding: EdgeInsets.all(0.02 * width),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    controller.chat[index],
                                    style: TextStyles.TextMReguler.copyWith(
                                        color: index % 2 == 0
                                            ? AppColors.Neutral800
                                            : AppColors.Neutral100),
                                  ),
                                  Text(
                                    '10.18',
                                    style: TextStyles.TextSReguler.copyWith(
                                        color: index % 2 == 0
                                            ? AppColors.Neutral400
                                            : AppColors.Neutral200),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
            SizedBox(height: 0.1 * height),
            Container(
              height: 0.05 * height,
              color: AppColors.White,
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: AppColors.Neutral300),
                          shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.attachment_outlined),
                      )),
                  const Gap(8),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Write a message...',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.Neutral200),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.Neutral300),
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.mic_rounded),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
