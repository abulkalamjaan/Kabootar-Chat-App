import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_first_flutter_project/database/user.dart';
import 'package:my_first_flutter_project/resources/strings.dart';
import 'package:my_first_flutter_project/ui/pages/auth/auth.dart';
import 'package:my_first_flutter_project/ui/pages/home.dart';
import 'package:my_first_flutter_project/ui/views/login.dart';
import 'package:my_first_flutter_project/ui/views/signup.dart';

class AuthController extends GetxController {
  RxBool busy = false.obs;
//  final formKey = GlobalKey<FormState>();
  Rx<UserModel> userModel = UserModel().obs;
  RxInt selectedIndex = 0.obs;

  changeView(int index) {
    selectedIndex.value = index;
    //update();
  }

  checkAuthentication() {
    if (FirebaseAuth.instance.currentUser != null) {
      // go to home
      Get.offAllNamed(HomePage.route);
    } else {
      //go to auth
      Get.offAllNamed(AuthPage.route);
    }
  }

  toggle() {
    busy.toggle();
  }

  logout() {
    FirebaseAuth.instance.signOut();
    GetStorage().remove(StringUtils.kUsers);
    Get.offAllNamed(AuthPage.route);
  }

  signUp() async {
    try {
      toggle();
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential cre = await auth.createUserWithEmailAndPassword(
          email: userModel.value.email, password: userModel.value.password);
      if (cre.user != null) {
        cre.user!.updateDisplayName(userModel.value.name);
        await FirebaseFirestore.instance
            .collection(StringUtils.kUsers)
            .doc(userModel.value.email.toString().toLowerCase())
            .set(userModel.value.toJson());
        saveUser();
        Get.snackbar("User Created", "Welcome to Kabutar App");
        Get.offAllNamed(HomePage.route);
      }
    } on FirebaseException catch (e) {
      Get.snackbar('Unable to create user!', e.message!,
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      toggle();
    }
  }

  isEmailVerified() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      //
      if (!user.emailVerified) {
        user.sendEmailVerification();
        return false;
      }
    }

    return true;
  }

  login() async {
    try {
      toggle();
      UserCredential cre = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userModel.value.email, password: userModel.value.password);
      if (cre.user != null) {
        var data = await FirebaseFirestore.instance
            .collection(StringUtils.kUsers)
            .doc(userModel.value.email)
            .get();
        if (data.exists) {
          UserModel user = UserModel.fromJson(data);
          userModel.value = user;
          saveUser();
          Get.offAllNamed(HomePage.route);
        }
      }
    } on FirebaseException catch (e) {
      Get.snackbar('Login failed!', e.message.toString());
    } finally {
      toggle();
    }
  }

  loadUser() {
    var data = GetStorage().read(StringUtils.kUsers);
    if (data != null) {
      userModel.value = UserModel.fromJson(jsonDecode(data));
    }
  }

  saveUser() {
    GetStorage()
        .write(StringUtils.kUsers, jsonEncode(userModel.value.toJson()));
  }
}
