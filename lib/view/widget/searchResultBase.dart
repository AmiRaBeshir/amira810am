import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:get/get.dart';

import '../../controller/searchResultController.dart';

Widget FilterChipSearchWidget({required String text, required bool stat}) {
  return FilterChip(
    label: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: stat ? AppColors.Neutral200 : AppColors.Neutral700,
      ),
    ),
    onSelected: (bool value) {},
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: stat ? AppColors.Primary900 : AppColors.Neutral300, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: stat ? AppColors.Primary900 : AppColors.Neutral900,
  );
}

Widget FilterChipsJobFilter({required String text, required int index}) {
  dynamic tempController = Get.find<SearchResultController>();
  return FilterChip(
    label: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: tempController.jobTypeFilter[index]
            ? AppColors.White
            : AppColors.Neutral700,
      ),
    ),
    onSelected: (bool value) {
      tempController.jobTypeFilter[index] =
          !tempController.jobTypeFilter[index];
      if (index < 3) {
        tempController.jobTypeFilter[index + 3] = false;
      } else {
        tempController.jobTypeFilter[index - 3] = false;
      }
      tempController.update();
      debugPrint(index.toString());
    },
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: tempController.jobTypeFilter[index]
              ? AppColors.Primary900
              : AppColors.Neutral500,
          width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: tempController.jobTypeFilter[index]
        ? AppColors.Primary900
        : AppColors.Neutral500,
  );
}
