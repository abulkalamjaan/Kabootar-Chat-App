import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controllers/auth.dart';
import 'package:my_first_flutter_project/ui/pages/auth/auth.dart';
import 'package:my_first_flutter_project/ui/pages/home.dart';
import 'package:my_first_flutter_project/resources/strings.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.find<AuthController>().checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            StringUtils.logo,
            width: MediaQuery.of(context).size.width * .6,
          ),
        ),
      ),
    );
  }
}
