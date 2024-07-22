import 'package:flutter/material.dart';

import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';

class ElevatedButtoncustom extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;

  const ElevatedButtoncustom({
    super.key,
    this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(327, 48),
          backgroundColor: AppColors.Primary500,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          text!,
          style: TextStyles.TextLMedium.copyWith(color: AppColors.White),
        ));
  }
}
