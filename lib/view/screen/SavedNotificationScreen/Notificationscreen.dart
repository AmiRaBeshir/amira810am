import 'package:flutter/material.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/model/notificationmodel.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
// import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Notification',
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
      body: SafeArea(
        child: newNotficition.length + oldNotficition.length == 0
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AssetsData.Notificationilustration,
                    ),
                    const Gap(24),
                    Text(
                      'No new notifications yet',
                      style: TextStyles.Heading3Medium,
                    ),
                    const Gap(8),
                    Text(
                      'You will receive a notification if there is \nsomething on your account',
                      style: TextStyles.TextLReguler.copyWith(
                          color: AppColors.Neutral500),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  newNotficition.isEmpty
                      ? const SizedBox()
                      : Container(
                          width: double.infinity,
                          color: AppColors.Neutral200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: Text(
                              ' New',
                              style: TextStyles.TextMMedium.copyWith(
                                color: AppColors.Neutral500,
                              ),
                            ),
                          ),
                        ),
                  const Gap(24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: newNotficition.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  newNotficition[index]['img']!,
                                  height: 40,
                                ),
                                const Gap(12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 211,
                                          child: Text(
                                            newNotficition[index]['name']!,
                                            style: TextStyles.TextMMedium,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 4,
                                              backgroundColor:
                                                  AppColors.Warning600,
                                            ),
                                            const Gap(8),
                                            Text(newNotficition[index]['time']!,
                                                style: TextStyles.TextSReguler
                                                    .copyWith(
                                                  color: AppColors.Neutral500,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          newNotficition[index]['msg']!,
                                          style:
                                              TextStyles.TextSReguler.copyWith(
                                                  color: AppColors.Neutral500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Gap(12),
                            const Divider(
                              color: AppColors.Neutral200,
                              thickness: 1,
                            ),
                            const Gap(12),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  oldNotficition.isEmpty
                      ? const SizedBox()
                      : Container(
                          width: double.infinity,
                          color: AppColors.Neutral200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: Text(
                              'Yesterday',
                              style: TextStyles.TextMMedium.copyWith(
                                color: AppColors.Neutral500,
                              ),
                            ),
                          ),
                        ),
                  const Gap(20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: oldNotficition.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.Primary100,
                                    child: Icon(
                                      index % 2 != 0
                                          ? Icons.manage_search
                                          : Icons.email_outlined,
                                      color: AppColors.Primary500,
                                    ),
                                  ),
                                  const Gap(12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 211,
                                            child: Text(
                                              oldNotficition[index]['name']!,
                                              style: TextStyles.TextMMedium,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 4,
                                                backgroundColor:
                                                    AppColors.Warning600,
                                              ),
                                              const Gap(8),
                                              Text(
                                                  newNotficition[index]
                                                      ['time']!,
                                                  style: TextStyles.TextSReguler
                                                      .copyWith(
                                                    color: AppColors.Neutral500,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Gap(4),
                                      Text(
                                        oldNotficition[index]['msg']!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.TextSReguler.copyWith(
                                            color: AppColors.Neutral500),
                                      ),
                                    ],
                                  ),
                                ]),
                            const Gap(12),
                            const Divider(
                              color: AppColors.Neutral200,
                              thickness: 1,
                            ),
                            const Gap(12),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
