import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';

Widget FilterChipWidget(String text) {
  return FilterChip(
    label: Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.white,
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

Widget FilterChipWidget2(String text) {
  return FilterChip(
    label: Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: AppColors.Primary900,
      ),
    ),
    onSelected: (bool value) {},
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: AppColors.Primary100,
  );
}
