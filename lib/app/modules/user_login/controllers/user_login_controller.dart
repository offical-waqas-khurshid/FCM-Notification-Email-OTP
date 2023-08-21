import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UserLoginController extends GetxController {
  //TODO: Implement UserLoginController

  final TextEditingController emailsController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  String appScheme = "comgooglemaps://";  // Replace with the desired app's URL scheme

  void openApp() async {
    if (await canLaunch(appScheme)) {
      await launch(appScheme);
    } else {
      // Handle the case where the app cannot be launched
      print("Cannot launch app");
    }
  }


}
