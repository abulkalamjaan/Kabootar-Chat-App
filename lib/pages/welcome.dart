import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/pages/auth/auth.dart';
import 'package:my_first_flutter_project/pages/home.dart';
import 'package:my_first_flutter_project/resources/strings.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isDarkModeOn = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, AuthPage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          StringUtils.logo,
          width: MediaQuery.of(context).size.width * .6,
        ),
      ),
    );
  }
}
