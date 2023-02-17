import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controllers/auth.dart';
import 'package:my_first_flutter_project/ui/pages/auth/reset_pass.dart';

import 'package:my_first_flutter_project/ui/views/app_button.dart';
import 'package:my_first_flutter_project/ui/views/helpers.dart';
import 'package:my_first_flutter_project/ui/views/loading.dart';
import 'package:my_first_flutter_project/ui/views/signup.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  final appButtonKey = GlobalKey<AppButtonState>();
  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                onChanged: ((value) =>
                    _controller.userModel.value.email = value),
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
                onChanged: ((value) =>
                    _controller.userModel.value.password = value),
                decoration: const InputDecoration(labelText: "Enter Password"),
              ),
              TextButton(
                onPressed: () async {
                  Get.toNamed(ForgetPassPage.route, arguments: 'saa');
                },
                child: const Text("Forgot Password?"),
              ),
              Obx(
                () => _controller.busy.isTrue
                    ? const LoadingView()
                    : FloatingActionButton.extended(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //login
                            _controller.login();
                          }
                        },
                        label: const Text("Login"),
                      ),
              ),
              vSpace,
              GestureDetector(
                onTap: () async {
                  //
                  AuthController auth = Get.find();
                  auth.changeView(1);
                },
                child: Text.rich(
                  TextSpan(
                    text: "Didn't have an account?",
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
