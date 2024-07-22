import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors/colors.dart' ;
import '../../../shared/styles/styels/textstyle.dart';

Widget buttonSheetField({required text ,required icon}){
  double width = Get.width;
  double height = Get.height;
  return Column(
    children: [
      const Gap(36),
      Container(
        width: 0.9* width,
        height: 0.06 *height,

        decoration: BoxDecoration(
          border: Border.all(width: 1,color: AppColors.Neutral300),
          borderRadius: BorderRadius.circular(50),

        ),
        child: Padding(
          padding:  const EdgeInsets.only(right:24 ,left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:[
                  Icon(icon),
                  const Gap(12),
                  Text(text,style:  TextStyles.TextLMedium.copyWith(color: AppColors.Neutral700),)

                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded,color: AppColors.Neutral900,)
            ],
          ),
        ),
      )
    ],
  );
}