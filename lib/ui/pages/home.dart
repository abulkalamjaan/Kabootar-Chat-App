import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:my_first_flutter_project/controllers/auth.dart';

class HomePage extends StatefulWidget {
  static String route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = 'inital';
  @override
  void initState() {
    super.initState();
    _controller.loadUser();
  }

  late final AuthController _controller = Get.find();
  @override
  void dispose() {
    //close it here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.userModel.value.name),
        actions: [
          IconButton(
            onPressed: () async {
              _controller.logout();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Text(
              _controller.userModel.value.toJson().toString(),
            ),
            Text(_controller.isEmailVerified()
                ? "Email is verfied"
                : "Please verify your email!"),
          ],
        ),
      ),
    );
  }
}
