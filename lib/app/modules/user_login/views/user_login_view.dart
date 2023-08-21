import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/user_login_controller.dart';

class UserLoginView extends GetView<UserLoginController> {
  const UserLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserLoginView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: controller.emailsController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Enter email'),
                MinLengthValidator(3,
                    errorText: 'Minimum 3 charecter filled email'),
              ]),
              decoration: const InputDecoration(
                  hintText: 'Enter Email',
                  labelText: 'Your Email',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  errorStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)))),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onPressed: () {
                  Get.offAndToNamed(Routes.HOME_SCREEN);
                },
              ),
            ),
          )),
        ],
      ),
    );
  }
}
