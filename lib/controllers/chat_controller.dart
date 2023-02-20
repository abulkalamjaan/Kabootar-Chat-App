import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/database/user.dart';
import 'package:my_first_flutter_project/resources/strings.dart';

class ChatController extends GetxController {
  RxBool busy = false.obs;

  addPersonToChat(UserModel user) async {
    try {
      _toggle();
      //add to friends
      await FirebaseFirestore.instance
          .collection(StringUtils.kUsers)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection(StringUtils.kFriends)
          .doc(user.email)
          .set(user.toJson());
    } on FirebaseException catch (e) {
    } finally {
      _toggle();
    }
  }

  _toggle() {
    busy.toggle();
    update();
  }
}
