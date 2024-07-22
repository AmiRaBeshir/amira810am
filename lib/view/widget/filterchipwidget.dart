import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';

Widget FilterChipWidget(String text) {
  return FilterChip(
    label: Text(
      text,
      style: TextStyles.TextSReguler.copyWith(
        fontSize: 12,
        color: AppColors.White,
      ),
    ),
    onSelected: (bool value) {},
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.Primary900, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: AppColors.Primary900,
  );
}
