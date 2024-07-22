import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:amira810am/Api/addportofolioapi.dart';
import 'package:amira810am/Api/editprofileapi.dart';
import 'package:amira810am/controller/profileScreenController.dart';
import 'package:amira810am/core/utils/assetsdata.dart';
import 'package:amira810am/model/addPortofolioModel.dart';
import 'package:amira810am/model/editProfileModel.dart';
import 'package:get/get.dart';

class EditPortofolioConrtoller extends GetxController {
  bool isloading = false;
  List<Map<String, String>> langList = [
    {
      'title': 'English',
      'image': AssetsData.England,
    },
    {
      'title': 'Indonesia',
      'image': AssetsData.Indonesia1,
    },
    {
      'title': 'Arabic',
      'image': AssetsData.SaudiArabia,
    },
    {
      'title': 'Chinese',
      'image': AssetsData.China1,
    },
    {
      'title': 'Dutch',
      'image': AssetsData.Netherlands,
    },
    {
      'title': 'French',
      'image': AssetsData.France,
    },
    {
      'title': 'German',
      'image': AssetsData.Germany,
    },
    {
      'title': 'Japanese',
      'image': AssetsData.Japan,
    },
    {
      'title': 'Korean',
      'image': AssetsData.SouthKorea,
    },
    {
      'title': 'Portuguese',
      'image': AssetsData.Portugal,
    },
  ];
  List<bool> isSelected = List.filled(11, false);

  var selectedLang = 'English';

  void setLang(value) {
    selectedLang = value;
    debugPrint('selectedLang: $selectedLang');
    update();
  }

  ProfileScreenController profController =
      Get.put<ProfileScreenController>(ProfileScreenController());

  EditProfileApi api = EditProfileApi();
  EditPortofolioModel epm = EditPortofolioModel();
  //*********************
  dynamic pickedFile;
  AddPortofolio apClass = AddPortofolio();
  AddPortfolioModel model = AddPortfolioModel();
  //**************

  Future<EditPortofolioModel> editProfileSendData(
      {required String bio,
      required String address,
      required String mobile}) async {
    isloading = true;
    update();
    epm = await api.editProfileSendData(
        bio, address, mobile, selectedLang, '', '');
    await profController.getPortfolio();
    isloading = false;
    update();
    return epm;
  }

  Future<void> changePhoto() async {
    pickedFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);
    apClass.addPortfolioApi(
        file: File(pickedFile.files.single.path),
        image: File(pickedFile.files.single.path));
  }
}
