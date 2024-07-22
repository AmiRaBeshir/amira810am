import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';

Widget textbot({required text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: TextStyles.TextLReguler),
            const Icon(Icons.arrow_forward)
          ],
        ),
        const Divider(
          color: AppColors.Neutral300,
          thickness: 2,
        ),
      ],
    ),
  );
}
