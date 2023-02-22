import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_project/database/user.dart';
import 'package:my_first_flutter_project/resources/strings.dart';

import 'auth.dart';

class UserController extends GetxController {
  RxBool busy = false.obs;
  Rx<UserModel> user = UserModel().obs;
  Rx<String> imagePath = ''.obs;
  updateImage(XFile file) {
    imagePath.value = file.path;

    update();
  }

  loadUser() {
    var data = GetStorage().read(StringUtils.kUsers);
    if (data != null) {
      user.value = UserModel.fromJson(jsonDecode(data));
    }
  }

  uploadProfileImage(File file) async {
    try {
      _toggle();
      // //upload image first
      Reference data = FirebaseStorage.instance
          .ref(StringUtils.kUsers)
          .child("${DateTime.now().microsecondsSinceEpoch}.jpg");

      var response = await data.putData(await file.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      if (response.state == TaskState.success) {
        Get.snackbar('Image', 'Uploaded');
        //uploaded

        user.value.photo = await data.getDownloadURL();
        await FirebaseFirestore.instance
            .collection(StringUtils.kUsers)
            .doc(user.value.email)
            .update({'photo': user.value.photo});
        GetStorage().write(StringUtils.kUsers, jsonEncode(user.value.toJson()));
        Get.back();
      }
    } catch (e) {
      //TODO: SHOW ERROR MESSAGE
    } finally {
      _toggle();
    }
  }

  _toggle() {
    busy.toggle();
    update();
  }
}
