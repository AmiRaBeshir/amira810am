import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:amira810am/Api/addportofolioapi.dart';
import 'package:amira810am/controller/profileScreenController.dart';
import 'package:amira810am/controller/saveImageController.dart';
import 'package:amira810am/model/addPortofolioModel.dart';
import 'package:amira810am/model/getUserPortfolioModel.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

class EditUploadPortfolioController extends GetxController {
  ProfileScreenController psc = ProfileScreenController();
  GetPortofoliosModel gus = GetPortofoliosModel();
  AddPortofolio apClass = AddPortofolio();
  AddPortfolioModel model = AddPortfolioModel();
  dynamic pickedFile;
  String? fileName;
  String? fileSize;
  bool isLoading = false;
  dynamic newImage;

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
    dynamic oldImage;
    try {
      oldImage = await SaveImageController.saveImage(
          psc.gusData.data!.portfolio!.last.image!, 'fileName');
      debugPrint('Image saved successfully');
    } catch (e) {
      debugPrint('Error: $e');
    }

    try {
      model = await apClass.addPortfolioApi(
        file: File(pickedFile.files.single.path),
        image: newImage ?? File(oldImage.path),
      );
      debugPrint('File uploaded successfully');
    } catch (e) {
      debugPrint('Error uploading file: $e');
    }
    await psc.getPortfolio();
    isLoading = false;
    update();
  }
}
