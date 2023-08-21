import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MFYS Technology'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(

        ),
      ),
    );
  }
}
