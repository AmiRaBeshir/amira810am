import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Privacy Policy', style: TextStyles.Heading4Medium),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(32),
                Text(
                  'Your privacy is important',
                  style: TextStyles.Heading4Medium,
                ),
                const Gap(12),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNam vel augue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at hendrerit\nmauris rutrum at. Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nam vel augue sit amet est\n molestie viverra. Nunc quis bibendum orci. Donec\nfeugiat massa mi, at hendrerit mauris rutrum at. Lorem\nipsum dolor sit amet, consectetur adipiscing elit. Nam\nvel augue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at hendrerit\nmauris rutrum at. \n \nNam vel augue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at hendrerit\nmauris rutrum at. Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nam vel augue sit amet est\nmolestie viverra. Nunc quis bibendum orci. Donec\nfeugiat massa mi, at hendrerit mauris rutrum at.',
                  style: TextStyles.TextMReguler.copyWith(
                      color: AppColors.Neutral500),
                ),
                const Gap(24),
                Text(
                  'Data controllers and contract partners',
                  style: TextStyles.Heading4Medium,
                ),
                const Gap(12),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNam vel augue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at hendrerit\nmauris rutrum at. Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nam vel augue sit amet est\n molestie viverra. Nunc quis bibendum orci. Donec\nfeugiat massa mi, at hendrerit mauris rutrum at. Lorem\nipsum dolor sit amet, consectetur adipiscing elit. Nam\nvel augue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at hendrerit\nmauris rutrum at. ',
                  style: TextStyles.TextMReguler.copyWith(
                      color: AppColors.Neutral500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
