import 'package:flutter/material.dart';
import 'package:amira810am/core/Routes/myRouts.dart';
import 'package:amira810am/view/screen/AppliedJobScreen/appliedJobscreen.dart';
import 'package:amira810am/view/screen/AppliedJobScreen/reApplyJob.dart';
import 'package:amira810am/view/screen/ApplyJobScreen/jobApplyComplete.dart';
import 'package:amira810am/view/screen/ApplyJobScreen/jobDetails.dart';
import 'package:amira810am/view/screen/CompleteProfileScreen/completeProfileScreen.dart';
import 'package:amira810am/view/screen/CompleteProfileScreen/editePersonalDetails.dart';
import 'package:amira810am/view/screen/CompleteProfileScreen/educationScreen.dart';
import 'package:amira810am/view/screen/CompleteProfileScreen/experienceScreen.dart';
import 'package:amira810am/view/screen/CreateAccountScreen/createaccount.dart';
import 'package:amira810am/view/screen/CreateAccountScreen/createaccount2.dart';
import 'package:amira810am/view/screen/CreateAccountScreen/createaccount3.dart';
import 'package:amira810am/view/screen/CreateAccountScreen/createaccount4.dart';
import 'package:amira810am/view/screen/ForgotPasswordScreen/resetPass2.dart';
import 'package:amira810am/view/screen/ForgotPasswordScreen/resetPass3.dart';
import 'package:amira810am/view/screen/ForgotPasswordScreen/resetPass4.dart';
import 'package:amira810am/view/screen/ForgotPasswordScreen/resetPassword.dart';
import 'package:amira810am/view/screen/HomeScreen/homescreen.dart';
import 'package:amira810am/view/screen/HomeScreen/search.dart';
import 'package:amira810am/view/screen/HomeScreen/searchResult.dart';
import 'package:amira810am/view/screen/MessageScreen/chatScreen.dart';
import 'package:amira810am/view/screen/MessageScreen/messageScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/EditNotificationScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/HelpCenterScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/PrivacyPolicyScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/TermsAndConditionsScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/changePasswordScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/editLanguage.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/editUploadPortfolio.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/editeprofilescreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/emailAddressScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/loginAndSecurityScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/phoneNumberScreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/towStepVerification3Screen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/twoStepVerification.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/twoStepVerification2.dart';
import 'package:amira810am/view/screen/SavedNotificationScreen/Notificationscreen.dart';
import 'package:amira810am/view/screen/SavedNotificationScreen/savedJobsscreen.dart';
import 'package:amira810am/view/screen/SignUpScreen/loginscreen.dart';
import 'package:amira810am/view/screen/OnboardingScreen/onboardingscreen.dart';
import 'package:amira810am/view/screen/ProfileSettingScreen/profileScreen.dart';
import 'package:amira810am/view/screen/splashview.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.Splashview,
      getPages: [
        GetPage(name: MyRoutes.Splashview, page: () => const Splashview()),
        GetPage(
            name: MyRoutes.OnboardingScreen,
            page: () => const OnboardingScreen()),
        GetPage(
            name: MyRoutes.CreateAccount, page: () => CreateAccountScreen()),
        GetPage(
            name: MyRoutes.CreateAccount2,
            page: () => const Createaccount2Screen()),
        GetPage(
            name: MyRoutes.CreateAccount3, page: () => CreateAccount3Screen()),
        GetPage(
            name: MyRoutes.CreateAccount4,
            page: () => const CreateAccount4Screen()),
        GetPage(name: MyRoutes.Login, page: () => LoginScreen()),
        GetPage(name: MyRoutes.ResetPass, page: () => ResetPassScreen()),
        GetPage(
            name: MyRoutes.ResetPass2, page: () => const ResetPass2Screen()),
        GetPage(name: MyRoutes.ResetPass3, page: () => ResetPass3Screen()),
        GetPage(
            name: MyRoutes.ResetPass4, page: () => const ResetPass4Screen()),
        GetPage(name: MyRoutes.HomeScreen, page: () => HomeScreen()),
        GetPage(name: MyRoutes.SearchScreen, page: () => const SearchScreen()),
        GetPage(name: MyRoutes.JobDetails, page: () => JobDetails()),
        GetPage(
            name: MyRoutes.SearchResult,
            page: () => const SearchResultScreen()),
        GetPage(name: MyRoutes.JobApply, page: () => AppliedJobScreen()),
        GetPage(
            name: MyRoutes.JobApplyComplete,
            page: () => JobApplyCompleteScreen()),
        GetPage(name: MyRoutes.ChatScreen, page: () => ChatScreen()),
        GetPage(
            name: MyRoutes.Notification,
            page: () => const NotificationScreen()),
        GetPage(name: MyRoutes.profileScreen, page: () => ProfileScreen()),
        GetPage(
            name: MyRoutes.EditProfile, page: () => const EditProfileScreen()),
        GetPage(
            name: MyRoutes.EditNotificationScreen,
            page: () => EditNotificationScreen()),
        GetPage(
            name: MyRoutes.EditLanguageScreen,
            page: () => EditLanguageScreen()),
        GetPage(name: MyRoutes.AppliedJob, page: () => AppliedJobScreen()),
        GetPage(name: MyRoutes.SavedJobScreen, page: () => const SavedJobs()),
        GetPage(name: MyRoutes.ReApplyJob, page: () => ReApplyJob()),
        GetPage(name: MyRoutes.MessageScreen, page: () => MessageScreen()),
        GetPage(
            name: MyRoutes.CompleteProfileScreen,
            page: () => CompleteProfileScreen()),
        GetPage(
            name: MyRoutes.EditPersonalDetails,
            page: () => EditPersonalDetails()),
        GetPage(
            name: MyRoutes.EditUploadPortfolio,
            page: () => const EditUploadPortfolioScreen()),
        GetPage(name: MyRoutes.EducationScreen, page: () => EducationScreen()),
        GetPage(
            name: MyRoutes.ExperienceScreen, page: () => ExperienceScreen()),
        GetPage(
            name: MyRoutes.LoginAndSecurityScreen,
            page: () => const LoginAndSecurityScreen()),
        GetPage(
            name: MyRoutes.EmailAddressScreen,
            page: () => EmailAddressScreen()),
        GetPage(
            name: MyRoutes.TwoStepVerification,
            page: () => TwoStepVerification()),
        GetPage(
            name: MyRoutes.TowStepVerification2Screen,
            page: () => TowStepVerification2Screen()),
        GetPage(
            name: MyRoutes.TowStepVerification3Screen,
            page: () => const TowStepVerification3Screen()),
        GetPage(
            name: MyRoutes.HelpCenterScreen,
            page: () => const HelpCenterScreen()),
        GetPage(
            name: MyRoutes.TermsAndConditionsScreen,
            page: () => const TermsAndConditionsScreen()),
        GetPage(
            name: MyRoutes.PrivacyPolicyScreen,
            page: () => const PrivacyPolicyScreen()),
        GetPage(
            name: MyRoutes.ChangePasswordScreen,
            page: () => ChangePasswordScreen()),
        GetPage(
            name: MyRoutes.PhoneNumberScreen,
            page: () => const PhoneNumberScreen()),
      ],
    );
  }
}
