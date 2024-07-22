import 'package:flutter/material.dart';
import 'package:amira810am/shared/componets/searchview.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Help Center', style: TextStyles.Heading4Medium),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomSearchView(
                  height: 48,
                  hintText: "What can we help?",
                ),
                const Gap(28),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: AppColors.Neutral300,
                            )),
                        child: ExpansionTile(
                            title: Text("Lorem ipsum dolor sit amet",
                                style: TextStyles.TextLMedium),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing\nelit. Fusce ultricies mi enim, quis vulputate nibh\nfaucibus at. Maecenas est ante, suscipit vel sem\nnon, blandit blandit erat. Praesent pulvinar ante et\nfelis porta vulputate. Curabitur ornare velit nec\nfringilla finibus. Phasellus mollis pharetra ante, in\nullamcorper massa ullamcorper et. Curabitur ac leo\nsit amet leo interdum mattis vel eu mauris.",
                                  style: TextStyles.TextMReguler.copyWith(
                                      color: AppColors.Neutral500),
                                ),
                              ),
                            ]),
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
