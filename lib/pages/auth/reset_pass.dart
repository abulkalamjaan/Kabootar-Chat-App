import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controllers/auth.dart';
import 'package:my_first_flutter_project/views/app_button.dart';

class ForgetPassPage extends StatelessWidget {
  static String route = '/reset-pass';
  ForgetPassPage({super.key});
  final AuthController _controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Obx(
              () => Switch(
                value: _controller.busy.value,
                onChanged: (val) {
                  _controller.toggle();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
