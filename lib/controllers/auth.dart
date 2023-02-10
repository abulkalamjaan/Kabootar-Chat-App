import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/database/user.dart';

class AuthController extends GetxController {
  RxBool busy = false.obs;
//  final formKey = GlobalKey<FormState>();
  Rx<UserModel> userModel = UserModel().obs;

  toggle() {
    busy.toggle();
  }

  signUp() async {
    try {
      toggle();
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential cre = await auth.createUserWithEmailAndPassword(
          email: userModel.value.email, password: userModel.value.password);

      Get.snackbar("User Created", "Welcome to Kabutar App");
      //redirect
    } on FirebaseException catch (e) {
      Get.snackbar('Unable to create user!', e.message!,
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      toggle();
    }
  }

  login(String email, String password) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
