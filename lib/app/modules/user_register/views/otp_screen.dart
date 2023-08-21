import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mfys_technology/app/modules/user_register/controllers/user_register_controller.dart';

import '../../user_login/views/user_login_view.dart';

class OTPScreenView extends GetView<UserRegisterController> {
  OTPScreenView({super.key});

  static EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200.0, left: 10, right: 10),
              child: Container(
                height: 200,
                child: Card(
                  elevation: 0.5,
                  color: Colors.grey.withOpacity(0.2),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                            controller: controller.otpController,
                            decoration:
                            const InputDecoration(hintText: "Enter OTP")),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const UserLoginView();
                              },
                            ));
                            // if (await myauth.verifyOTP(
                            //         otp: controller.otpController.text) ==
                            //     true) {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(const SnackBar(
                            //     content: Text("OTP is verified"),
                            //   ));
                            //   Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) {
                            //       return UserLoginView();
                            //     },
                            //   ));
                            // } else {
                            //   // ScaffoldMessenger.of(context)
                            //   //     .showSnackBar(const SnackBar(
                            //   //   content: Text("Invalid OTP"),
                            //   // ));
                            // }
                          },
                          child: const Text("Verify")),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
