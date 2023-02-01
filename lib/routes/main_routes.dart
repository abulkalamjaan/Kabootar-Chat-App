import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/pages/auth/auth.dart';
import 'package:my_first_flutter_project/pages/home.dart';
import 'package:my_first_flutter_project/pages/welcome.dart';

class MainRoutes {
  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => WelcomePage(),
    '/home': (context) => HomePage(),
    AuthPage.route: (context) => AuthPage()
  };
}
