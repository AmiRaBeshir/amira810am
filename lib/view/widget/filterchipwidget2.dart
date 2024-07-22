import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';

Widget FilterChipWidget2(String text) {
  return FilterChip(
    label: Text(
      text,
      style: TextStyles.TextSReguler.copyWith(
        color: AppColors.Primary900,
      ),
    ),
    onSelected: (bool value) {},
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.White, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: AppColors.Primary100,
  );
}
