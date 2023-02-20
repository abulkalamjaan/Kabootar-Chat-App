import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/database/user.dart';
import 'package:my_first_flutter_project/resources/strings.dart';

class SearchController extends GetxController {
  RxBool busy = false.obs;
  final RxList<UserModel> users = <UserModel>[].obs;

  search(String pattern) async {
    try {
      _toggle();
      //search
      var usersFromFirebase = await FirebaseFirestore.instance
          .collection(StringUtils.kUsers)
          .where('email', isEqualTo: pattern)
          .get();
      users.clear();
      for (var data in usersFromFirebase.docs) {
        users.add(UserModel.fromJson(data.data()));
      }
    } on FirebaseException catch (e) {
      Get.snackbar('Searching failed', e.message.toString());
    } finally {
      _toggle();
    }
  }

  _toggle() {
    busy.toggle();
    update();
  }
}
