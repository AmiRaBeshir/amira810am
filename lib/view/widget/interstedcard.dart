import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:get/get.dart';

Widget interstedCard(String title, dynamic image, bool isClicked) {
  final w = Get.width;
  final h = Get.height;

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isClicked ? AppColors.Primary500 : AppColors.Neutral300,
        width: isClicked ? 1.5 : 1,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color:
                      isClicked ? AppColors.Primary500 : AppColors.Neutral300,
                  width: 1),
            ),
            width: 48,
            height: 48,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: AppColors.White,
              child: Image.asset(image),
            ),
          ),
          // const Gap(16),
          Text(
            title,
            style: TextStyles.TextLReguler,
          )
        ],
      ),
    ),
  );
}
