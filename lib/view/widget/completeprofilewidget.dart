import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

Widget box(
    {required color, required text, required mainText, required backColor}) {
  double width = Get.width;
  double height = Get.height;
  return Column(
    children: [
      Container(
        height: 0.11 * height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color,
          ),
          color: backColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 0.04 * width,
                      backgroundColor: color,
                      child: const Icon(
                        Icons.done,
                        color: AppColors.White,
                      )),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mainText,
                        style: TextStyles.TextLMedium,
                      ),
                      const Gap(4),
                      Text(
                        text,
                        style: TextStyles.TextSReguler.copyWith(
                            color: AppColors.Neutral500),
                      )
                    ],
                  )
                ],
              ),
              const Icon(
                Icons.arrow_forward_sharp,
                color: AppColors.Neutral900,
              )
            ],
          ),
        ),
      ),
    ],
  );
}
