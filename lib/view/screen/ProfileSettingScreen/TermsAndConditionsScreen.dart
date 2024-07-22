import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = Get.width;
    // double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Login and security', style: TextStyles.Heading4Medium),
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
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(32),
              Text(
                'Lorem ipsum dolor',
                style: TextStyles.Heading4Medium,
              ),
              const Gap(12),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNam vel augue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at hendrerit\nmauris rutrum at. Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nam vel augue sit amet est\n molestie viverra. Nunc quis bibendum orci. Donec\nfeugiat massa mi, at hendrerit mauris rutrum at. Lorem\nipsum dolor sit amet, consectetur adipiscing elit. Nam\nvel augue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at hendrerit\nmauris rutrum at. ',
                style: TextStyles.TextMReguler.copyWith(
                    color: AppColors.Neutral500),
              ),
              const Gap(17),
              Text(
                'Lorem ipsum dolor',
                style: TextStyles.Heading4Medium,
              ),
              const Gap(12),
              Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi, at\nhendrerit mauris rutrum at. Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. ',
                style: TextStyles.TextMReguler.copyWith(
                    color: AppColors.Neutral500),
              ),
              const Gap(12),
              Container(
                color: AppColors.Neutral100,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: Text(
                    'Nunc quis bibendum orci. Donec feugiat massa\nmi, at hendrerit mauris rutrum at. Lorem ipsum\ndolor sit amet, consectetur adipiscing elit. Nam vel\naugue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at\nhendrerit mauris rutrum at.',
                    style: TextStyles.TextMReguler.copyWith(
                        color: AppColors.Neutral500),
                  ),
                ),
              ),
              const Gap(12),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNam vel augue sit amet est molestie viverra. Nunc quis\nbibendum orci. Donec feugiat massa mi, at hendrerit\nmauris rutrum at. ',
                style: TextStyles.TextMReguler.copyWith(
                    color: AppColors.Neutral500),
              ),
              const Gap(17),
            ],
          ),
        ),
      )),
    );
  }
}
