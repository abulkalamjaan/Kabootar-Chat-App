import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/ui/pages/auth/auth.dart';
import 'package:my_first_flutter_project/ui/pages/auth/reset_pass.dart';
import 'package:my_first_flutter_project/ui/pages/home.dart';
import 'package:my_first_flutter_project/ui/pages/welcome.dart';

class MainRoutes {
  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => WelcomePage(),
    '/home': (context) => HomePage(),
    AuthPage.route: (context) => AuthPage(),
    ForgetPassPage.route: (p0) => ForgetPassPage(),
    HomePage.route: (p0) => HomePage(),
  };
}
