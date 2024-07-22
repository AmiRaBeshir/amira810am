import 'package:flutter/material.dart';
import 'package:amira810am/controller/editnotificationcontroller.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EditNotificationScreen extends StatelessWidget {
  EditNotificationController controller = Get.put(EditNotificationController());
  EditNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List jobNotification = [
      'Your Job Search Alert',
      'Job Application Update',
      'Job Application Reminders',
      'Jobs You May Be Interested In',
      'Job Seeker Updates',
    ];
    List otherNotification = [
      'Show Profile',
      'All Message',
      'Message Nudges',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification', style: TextStyles.Heading4Medium),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Gap(32),
            Container(
              width: double.infinity,
              color: AppColors.Neutral200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  'Job notification',
                  style: TextStyles.TextMMedium.copyWith(
                    color: AppColors.Neutral500,
                  ),
                ),
              ),
            ),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: jobNotification.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(jobNotification[index],
                                    style: TextStyles.TextLReguler),
                                GetBuilder<EditNotificationController>(
                                    builder: (logic) {
                                  return FlutterSwitch(
                                    width: 48,
                                    height: 26,
                                    toggleSize: 15,
                                    value: logic.isSwitched[index],
                                    borderRadius: 30.0,
                                    onToggle: (val) {
                                      logic.changeIsSwitched(
                                          value: val, item: index);
                                    },
                                  );
                                }),
                              ],
                            ),
                          ),
                          const Divider(
                            color: AppColors.Neutral300,
                            thickness: 2,
                          ),
                        ],
                      )),
            ),
            const Gap(32),
            Container(
              width: double.infinity,
              color: AppColors.Neutral200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  'Other notification',
                  style: TextStyles.TextMMedium.copyWith(
                    color: AppColors.Neutral500,
                  ),
                ),
              ),
            ),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: otherNotification.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(otherNotification[index],
                                  style: TextStyles.TextLReguler),
                              GetBuilder<EditNotificationController>(
                                  builder: (logic) {
                                return FlutterSwitch(
                                  width: 60,
                                  height: 30,
                                  toggleSize: 15,
                                  value: logic.isSwitched[index + 5],
                                  borderRadius: 30.0,
                                  onToggle: (val) {
                                    logic.changeIsSwitched(
                                        value: val, item: index + 5);
                                  },
                                );
                              }),
                            ],
                          ),
                          const Divider(
                            color: AppColors.Neutral300,
                            thickness: 2,
                          ),
                        ],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
