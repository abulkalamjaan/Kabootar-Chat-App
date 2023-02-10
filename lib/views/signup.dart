import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controllers/auth.dart';
import 'package:my_first_flutter_project/database/user.dart';
import 'package:my_first_flutter_project/resources/strings.dart';
import 'package:my_first_flutter_project/views/helpers.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.all(16),
        child: Form(
          //    key: _controller.formKey,
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.asset(
                  StringUtils.logo,
                  width: Get.width * .2,
                  height: Get.height * .2,
                ),
                TextFormField(
                  onChanged: (value) =>
                      _controller.userModel.value.email = value,
                  validator: (value) {
                    if (value!.contains('@') &&
                        value.contains('.') &&
                        value.length > 5) {
                      return null;
                    }

                    return "Invalid email pattern!";
                  },
                  decoration: const InputDecoration(labelText: "Enter Email"),
                ),
                vSpace,
                TextFormField(
                  onChanged: (value) =>
                      _controller.userModel.value..name = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name field is empty!";
                    }
                  },
                  decoration:
                      const InputDecoration(labelText: "Enter Full Name"),
                ),
                vSpace,
                TextFormField(
                  onChanged: (value) =>
                      _controller.userModel.value..password = value,
                  decoration:
                      const InputDecoration(labelText: "Enter Password"),
                ),
                vSpace,
                Obx(
                  () => _controller.busy.isTrue
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : FloatingActionButton.extended(
                          onPressed: () async {
                            _controller.signUp();
                            // if (_controller.formKey.currentState!.validate()) {}
                          },
                          label: const Text("Create Account"),
                        ),
                ),
                vSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
