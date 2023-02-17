import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controllers/auth.dart';
import 'package:my_first_flutter_project/ui/views/login.dart';
import 'package:my_first_flutter_project/ui/views/signup.dart';

import '../../../resources/strings.dart';

class AuthPage extends StatelessWidget {
  static String route = '/auth';
  AuthPage({super.key});
  final AuthController _controller = Get.find();
  final List<Widget> authViews = [LoginView(), SignUpView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                StringUtils.logo,
                width: Get.width * .4,
                height: Get.height * .2,
              ),
            ),
            Obx(
              () => authViews[_controller.selectedIndex.value],
            )
          ],
        ),
      ),
    );
  }
}
