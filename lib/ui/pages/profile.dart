import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_project/controllers/user_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatelessWidget {
  static String route = '/profile';
  ProfilePage({super.key});
  final _controller = UserController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _controller.loadUser(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(_controller.user.value.name.toString())),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () async {
                    if (await Permission.storage.isDenied) {
                      await Permission.storage.request();
                      return;
                    }

                    //pick image
                    var image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      //display in container
                      _controller.updateImage(image);
                      Get.dialog(AlertDialog(
                        title: const Text("Do you wish to upload that image?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              _controller.uploadProfileImage(File(image.path));
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      ));
                    }
                  },
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      width: Get.width * .4,
                      height: Get.height * .3,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          shape: BoxShape.circle,
                          image: getImage()),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  DecorationImage? getImage() {
    if (_controller.imagePath.value.isNotEmpty) {
      return DecorationImage(
        image: FileImage(
          File(_controller.imagePath.value),
        ),
      );
    }

    if (_controller.user.value.photo != null) {
      return DecorationImage(image: NetworkImage(_controller.user.value.photo));
    }
    return null;
  }
}
