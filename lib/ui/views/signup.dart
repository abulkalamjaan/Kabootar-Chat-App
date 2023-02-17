import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controllers/auth.dart';
import 'package:my_first_flutter_project/database/user.dart';
import 'package:my_first_flutter_project/resources/strings.dart';
import 'package:my_first_flutter_project/ui/views/helpers.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _controller = AuthController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => _controller.userModel.value.email = value,
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
                onChanged: (value) => _controller.userModel.value..name = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name field is empty!";
                  }
                },
                decoration: const InputDecoration(labelText: "Enter Full Name"),
              ),
              vSpace,
              TextFormField(
                onChanged: (value) =>
                    _controller.userModel.value..password = value,
                decoration: const InputDecoration(labelText: "Enter Password"),
              ),
              vSpace,
              Obx(
                () => _controller.busy.isTrue
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : FloatingActionButton.extended(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _controller.signUp();
                          }
                        },
                        label: const Text("Create Account"),
                      ),
              ),
              vSpace,
              GestureDetector(
                onTap: () async {
                  //
                  AuthController auth = Get.find();
                  auth.changeView(0);
                },
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account?",
                    children: [
                      TextSpan(
                        text: " Click here.",
                        style: TextStyle(color: Get.theme.primaryColor),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
