import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/utils/assetsdata.dart';

class MessageController extends GetxController {
  bool unRead = false;
  void changeUnRead(value) {
    unRead = value;

    update();
  }

  List message = [
    {
      'name': 'Twitter',
      'Content': 'Here is the link: http://zoom.com/abcdeefg',
      'time': '12.39',
      'read': false,
      'image': AssetsData.Twitterlogo1,
    },
    {
      'name': 'Gojek Indonesia',
      'Content': 'Let’s keep in touch.',
      'time': '12.39',
      'read': false,
      'image': AssetsData.Gojeklogo,
    },
    {
      'name': 'Shoope',
      'Content': 'Thank You David!',
      'time': '09.45',
      'read': true,
      'image': AssetsData.Shoopelogo,
    },
    {
      'name': 'Dana',
      'Content': 'Thank you for your attention!',
      'time': 'Yesterday',
      'read': false,
      'image': AssetsData.Danalogo,
    },
    {
      'name': 'Slack',
      'Content': 'You: I look forward to hearing from you',
      'time': '12/8',
      'read': true,
      'image': AssetsData.Slacklogo,
    },
    {
      'name': 'Facebook',
      'Content': 'You: What about the interview stage?',
      'time': '12/8',
      'read': true,
      'image': AssetsData.Facebook,
    },
  ];
}
