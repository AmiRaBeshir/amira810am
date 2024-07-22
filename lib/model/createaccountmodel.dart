import 'package:flutter/material.dart';
import 'package:amira810am/core/utils/assetsdata.dart';

class CreateAccountModel {
  static List<Map<String, dynamic>> inersets = [
    {'title': 'UI/UX Designer', 'icon': Icons.design_services_outlined},
    {'title': 'Ilustrator Designer', 'icon': Icons.architecture_outlined},
    {'title': 'Developer', 'icon': Icons.terminal},
    {'title': 'Management', 'icon': Icons.manage_accounts_outlined},
    {'title': 'Information Technology', 'icon': Icons.computer_outlined},
    {'title': 'Research and Analytics', 'icon': Icons.analytics_outlined},
  ];
  static List isInersetsCliced = List.filled(inersets.length, false);
  static List<Map<String, dynamic>> countries = [
    {'title': 'United States', "image": AssetsData.UnitedStates},
    {'title': 'Malaysia', "image": AssetsData.Malaysia},
    {'title': 'Singapore', "image": AssetsData.Singapore},
    {'title': 'Indonesia', "image": AssetsData.Indonesia},
    {'title': 'Philiphines', "image": AssetsData.Philiphines},
    {'title': 'Polandia', "image": AssetsData.Polandia},
    {'title': 'India', "image": AssetsData.India},
    {'title': 'Vietnam', "image": AssetsData.Vietnam},
    {'title': 'China', "image": AssetsData.China},
    {'title': 'Canada', "image": AssetsData.Canada},
    {'title': 'Saudi Arabia', "image": AssetsData.SaudiArabia},
    {'title': 'Argentina', "image": AssetsData.Argentina},
    {'title': 'Brazil', "image": AssetsData.Brazil},
  ];

  static List isFlagCliced = List.filled(countries.length, false);
}
