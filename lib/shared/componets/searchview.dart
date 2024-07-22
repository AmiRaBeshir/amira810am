import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:flutter/material.dart';

class CustomSearchView extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  final Widget? perfix;
  final Widget? suffixIcon;

  final Alignment? alignment;
  final TextInputType? textInputType;
  final double? width;
  final double? height;
  final String? hintText;
  final Color? fillcolor;
  // GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CustomSearchView({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.height,
    this.width,
    this.perfix,
    this.textInputType,
    this.alignment,
    this.fillcolor,
    this.suffixIcon,
  });

  @override
  Widget build(Object context) {
    return Form(
      // key: formstate,
      child: TextField(
        onTap: () {},
        // validator: validator,
        // controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          labelStyle: TextStyles.MediumReguler,
          contentPadding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(width: 1, color: AppColors.Neutral300),
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 24,
          ),

          // suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.Neutral300)),
          border: OutlineInputBorder(
            gapPadding: 12,
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(width: 1, color: AppColors.Neutral300),
          ),
        ),
      ),
    );
  }
}

// filterjobfunction() {
//   var formstate;
//   var formdata = formstate.currentState;

//   if (formdata!.validate()) {
//     Navigator.push(
//       context as BuildContext,
//       MaterialPageRoute(
//         builder: (context) {
//           return HomeScreenFour();
//         },
//       ),
//     );
//   }
// }
