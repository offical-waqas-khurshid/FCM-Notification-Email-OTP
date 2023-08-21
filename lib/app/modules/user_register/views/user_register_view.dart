import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../controllers/user_register_controller.dart';
import 'otp_screen.dart';

class UserRegisterView extends GetView<UserRegisterController> {
  UserRegisterView({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserRegisterView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 100,
                          //decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(40),
                          //border: Border.all(color: Colors.blueGrey)),
                          //child: Image.asset('assets/logo.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: controller.nameController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter named'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 charecter filled name'),
                        ]),
                        decoration: const InputDecoration(
                            hintText: 'Enter Name',
                            labelText: 'Your Named',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: controller.fatherNameController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter father named'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 charecter filled name'),
                        ]),
                        decoration: const InputDecoration(
                            hintText: 'Enter Father Name',
                            labelText: 'Father Named',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.emailController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter email address'),
                          EmailValidator(
                              errorText: 'Please correct email filled'),
                        ]),
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.passwordController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter password'),
                          EmailValidator(errorText: 'Please correct password'),
                        ]),
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            labelText: 'password',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          onPressed: () async {
                            myauth.setConfig(
                                appEmail: "waqaskhurshidoffical@gmail.com",
                                appName: "Email OTP",
                                userEmail: controller.emailController.text,
                                otpLength: 6,
                                otpType: OTPType.digitsOnly);
                            if (await myauth.sendOTP() == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("OTP has been sent"),
                              ));
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return OTPScreenView();
                                },
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Oops, OTP send failed"),
                              ));
                            }
                            controller.registerUser();
                          },
                        ),
                      ),
                    )),
                  ],
                )),
          ),
        ));
  }
}
