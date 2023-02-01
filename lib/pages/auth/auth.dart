import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/views/login.dart';
import 'package:my_first_flutter_project/views/signup.dart';

class AuthPage extends StatelessWidget {
  static String route = '/auth';
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: SafeArea(
            child: TabBar(
              labelColor: Theme.of(context).primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              labelStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 18,
              ),
              tabs: [
                Tab(
                  text: "Login",
                ),
                Tab(
                  text: "Sign Up",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            LoginView(),
            SignUpView(),
          ],
        ),
      ),
    );
  }
}
