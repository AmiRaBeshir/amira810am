import 'package:flutter/material.dart';
import 'package:amira810am/Api/getuserportfolioapi.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:get/get.dart';

import '../../model/getUserPortfolioModel.dart';

class ProfileScreenController extends GetxController {
  GetUserPortfolio gus = GetUserPortfolio();
  GetPortofoliosModel gusData = GetPortofoliosModel();
  bool isLoading = false;

  List<Map<String, dynamic>> generalSettings = [
    {
      'title': 'Edit Profile',
      'icon': Icons.person_outlined,
    },
    {'title': 'Portfolio', 'icon': Icons.drive_folder_upload},
    {'title': 'Language', 'icon': Icons.language},
    {'title': 'Notification', 'icon': Icons.notifications_none_outlined},
    {'title': 'Login and security', 'icon': Icons.lock_person_outlined},
    {'title': 'Complete Profile', 'icon': Icons.person_add_alt_1_outlined}
  ];
  List otherSettings = [
    'Accessibility',
    'Help Center',
    'Terms & Conditions',
    'Privacy Policy',
  ];

  void onclickGotoPAge({required String title}) {
    title == 'Edit Profile'
        ? Get.toNamed(MyRoutes.EditProfile)
        : title == 'Portfolio'
            ? Get.toNamed(MyRoutes.UploadPortfolio)
            : title == 'Language'
                ? Get.offAndToNamed(MyRoutes.EditLanguageScreen)
                : title == 'Login and security'
                    ? Get.toNamed(MyRoutes.LoginAndSecurityScreen)
                    : title == 'Complete Profile'
                        ? Get.toNamed(MyRoutes.CompleteProfileScreen)
                        : title == 'Accessibility'
                            ? null
                            : title == 'Help Center'
                                ? Get.toNamed(MyRoutes.HelpCenterScreen)
                                : title == 'Terms & Conditions'
                                    ? Get.toNamed(
                                        MyRoutes.TermsAndConditionsScreen)
                                    : title == 'Privacy Policy'
                                        ? Get.toNamed(
                                            MyRoutes.PrivacyPolicyScreen)
                                        : null;
  }

  Future<void> getPortfolio() async {
    isLoading = true;
    gusData = await gus.getPortfolio();
    isLoading = false;
    update();
  }
}
