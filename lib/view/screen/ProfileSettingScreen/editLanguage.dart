import 'package:flutter/material.dart';
import 'package:amira810am/controller/editportofoliocontroller.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EditLanguageScreen extends StatelessWidget {
  final w = Get.width;

  EditPortofolioConrtoller controller =
      Get.put<EditPortofolioConrtoller>(EditPortofolioConrtoller());

  EditLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Language', style: TextStyles.Heading4Medium),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<EditPortofolioConrtoller>(builder: (context) {
          return ListView.builder(
            itemCount: controller.langList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            controller.langList[index]['image']!,
                          ),
                          const Gap(12),
                          Text(controller.langList[index]['title']!),
                        ],
                      ),
                      Radio(
                        value: controller.langList[index]['title'],
                        groupValue: controller.selectedLang,
                        onChanged: (value) {
                          controller.setLang(value);
                        },
                      ),
                    ]),
                const Divider(
                  color: AppColors.Neutral300,
                  thickness: 1,
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
