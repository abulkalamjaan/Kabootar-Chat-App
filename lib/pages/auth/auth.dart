import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/views/login.dart';
import 'package:my_first_flutter_project/views/signup.dart';

class AuthPage extends StatefulWidget {
  static String route = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70),
        child: SafeArea(
          child: TabBar(
            controller: _tabController,
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
        controller: _tabController,
        children: [
          LoginView(),
          SignUpView(),
        ],
      ),
    );
  }
}
