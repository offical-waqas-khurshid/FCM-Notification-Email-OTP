import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mfys_technology/app/modules/user_register/views/otp_screen.dart';
import 'package:mfys_technology/app/routes/app_pages.dart';

import '../../../models/user_model.dart';

class UserRegisterController extends GetxController {
//TODO create Text Editing Controller

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  ///Todo create user register method

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel userModel = UserModel();

  void registerUser() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Store additional user data in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': nameController.text,
        'fatherName': fatherNameController.text,
        'email': emailController.text,
      });
    } catch (e) {
    print(e);
    }
  }

  // Future<String> signIn({required String email, required String password}) async {
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //
  //     return "Signed In";
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       return "No user found for that email.";
  //     } else if (e.code == 'wrong-password') {
  //       return "Wrong password provided for that user.";
  //     } else {
  //       return "Something Went Wrong.";
  //     }
  //   }
  // }

  //2


  // Future<String> signUp({String email, String password}) async {
  //   try {
  //     await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     return "Signed Up";
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       return "The password provided is too weak.";
  //     } else if (e.code == 'email-already-in-use') {
  //       return "The account already exists for that email.";
  //     } else {
  //       return "Something Went Wrong.";
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    fatherNameController.dispose();
    passwordController.dispose();
  }
}
