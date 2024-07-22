import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:amira810am/Api/addportofolioapi.dart';
import 'package:amira810am/controller/profileScreenController.dart';
import 'package:amira810am/model/addPortofolioModel.dart';
import 'package:amira810am/model/getUserPortfolioModel.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

class UploadPortfolioController extends GetxController {
  ProfileScreenController psc = ProfileScreenController();
  GetPortofoliosModel gus = GetPortofoliosModel();
  AddPortofolio apClass = AddPortofolio();
  AddPortfolioModel model = AddPortfolioModel();
  dynamic pickedFile;
  String? fileName;
  String? fileSize;
  bool isLoading = false;

  Future<void> selectPortfolio() async {
    pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf', 'doc', 'docx']);
    fileName = p.basename(pickedFile.files.single.path.toString());
    fileSize = (pickedFile.files.single.size / 1024).toStringAsFixed(0) + " KB";
  }

  Future<void> uploadFile() async {
    await selectPortfolio();
    isLoading = true;
    update();
    try {
      debugPrint('Image saved successfully');
    } catch (e) {
      debugPrint('Error: $e');
    }

    model = await apClass.addPortfolioApi(
      file: File(pickedFile.files.single.path),
      image: File(pickedFile.files.single.path),
    );
    debugPrint('File uploaded successfully');

    await psc.getPortfolio();
    isLoading = false;
    update();
  }
}
