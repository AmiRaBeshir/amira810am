// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';

class onboardingWidget extends StatelessWidget {
  final Map<String, String> data;
  const onboardingWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Center(
      child: Column(children: [
        Image.asset(
          data['image'] ?? '',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: h * 0.02,
        ),
        data['title'] == "title1"
            ? Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Find a job, and ",
                          style: TextStyles.Heading1Medium,
                          children: <TextSpan>[
                            TextSpan(
                                text: "start building ",
                                style: TextStyles.Heading1Medium.copyWith(
                                    color: AppColors.Primary500)),
                            TextSpan(
                              text: "your career from now on",
                              style: TextStyles.Heading1Medium,
                            ),
                          ]),
                    ])),
              )
            : data['title'] == "title2"
                ? Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Hundreds of jobs are waiting for you to ",
                              style: TextStyles.Heading1Medium,
                              children: <TextSpan>[
                                TextSpan(
                                    text: " join together ",
                                    style: TextStyles.Heading1Medium.copyWith(
                                        color: AppColors.Primary500)),
                              ]),
                        ])),
                  )
                : data['title'] == "title3"
                    ? Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Get the best",
                                  style: TextStyles.Heading1Medium,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "choice for the job",
                                        style:
                                            TextStyles.Heading1Medium.copyWith(
                                                color: AppColors.Primary500)),
                                    TextSpan(
                                      text: "you've always dreamed of",
                                      style: TextStyles.Heading1Medium,
                                    ),
                                  ]),
                            ])),
                      )
                    : const Text(""),
        SizedBox(
          height: h * .02,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Text(
            data['description'] ?? "",
            style:
                TextStyles.TextLReguler.copyWith(color: AppColors.Neutral500),
          ),
        ),
      ]),
    );
  }
}
