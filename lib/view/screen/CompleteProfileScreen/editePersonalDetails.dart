import 'package:flutter/material.dart';
import 'package:amira810am/controller/editpersonaldetailscontroller1.dart';
import 'package:amira810am/controller/profileScreenController.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/shared/styles/colors/colors.dart';
import 'package:amira810am/shared/styles/styels/textstyle.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditPersonalDetails extends StatelessWidget {
  EditPersonalDetails({super.key});
  ProfileScreenController profController =
      Get.put<ProfileScreenController>(ProfileScreenController());

  TextEditingController nameTxtController = TextEditingController();
  TextEditingController bioTxtController = TextEditingController();
  TextEditingController addressTxtController = TextEditingController();
  TextEditingController phoneTxtController = TextEditingController();

  EditPersonalDetailsController1 controller =
      Get.put<EditPersonalDetailsController1>(EditPersonalDetailsController1());
  final w = Get.width;

  @override
  Widget build(BuildContext context) {
    profController.getPortfolio();

    nameTxtController.text = profController.gusData.data!.profile!.name!;
    bioTxtController.text = profController.gusData.data!.profile!.bio ?? "";
    addressTxtController.text =
        profController.gusData.data!.profile!.address ?? "";
    phoneTxtController.text =
        profController.gusData.data!.profile!.mobile ?? "";

    return Scaffold(
      floatingActionButton: SizedBox(
        width: w * 0.8,
        height: 50,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: AppColors.Primary500,
          onPressed: () async {
            await controller.editProfileSendData(
                bio: bioTxtController.text,
                address: addressTxtController.text,
                mobile: phoneTxtController.text,
                edu: '',
                exp: '');
            controller.epm.status!
                ? Get.back()
                : Get.snackbar(
                    'error',
                    'some thing wrong please try again',
                    backgroundColor: AppColors.Danger500,
                  );
          },
          child: GetBuilder<EditPersonalDetailsController1>(
            builder: (controller) => Text(
              controller.isloading ? 'Loading...' : 'Save',
              style: const TextStyle(fontSize: 14, color: AppColors.White),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Personal Details', style: TextStyles.Heading4Medium),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Gap(36),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: const AssetImage(
                                    AssetsData.Profile22,
                                  ),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.darken,
                                  )),
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: AppColors.White, width: 2)),
                        ),
                        const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 32,
                            color: AppColors.White,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(8),
                TextButton(
                    onPressed: () async {
                      // await controller.changePhoto();
                    },
                    child: Text(
                      'Change Photo',
                      style: TextStyles.TextLMedium.copyWith(
                        color: AppColors.Primary500,
                      ),
                    )),
                const Gap(25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      textAlign: TextAlign.left,
                      style: TextStyles.TextLMedium.copyWith(
                          color: AppColors.Neutral400),
                    ),
                    const Gap(8),
                    TextField(
                      controller: nameTxtController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: 'Enter your name',
                        hintStyle: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral800),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.Neutral300)),
                      ),
                    ),
                    const Gap(16),
                    Text(
                      'Bio',
                      textAlign: TextAlign.left,
                      style: TextStyles.TextLMedium.copyWith(
                          color: AppColors.Neutral400),
                    ),
                    TextField(
                      controller: bioTxtController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: 'Enter your Bio',
                        hintStyle: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral800),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.Neutral300)),
                      ),
                    ),
                    const Gap(16),
                    Text(
                      'Address',
                      textAlign: TextAlign.left,
                      style: TextStyles.TextLMedium.copyWith(
                          color: AppColors.Neutral400),
                    ),
                    TextField(
                      controller: addressTxtController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: 'Enter your Address',
                        hintStyle: TextStyles.TextLMedium.copyWith(
                            color: AppColors.Neutral800),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Text(
                      'No.Handphone',
                      textAlign: TextAlign.left,
                      style: TextStyles.TextLMedium.copyWith(
                          color: AppColors.Neutral400),
                    ),
                    IntlPhoneField(
                      controller: phoneTxtController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      onChanged: (phone) {
                        // print(phone.completeNumber);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
