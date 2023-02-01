import 'package:flutter/material.dart';

import 'package:my_first_flutter_project/pages/welcome.dart';
import 'package:my_first_flutter_project/resources/themes.dart';
import 'package:my_first_flutter_project/routes/main_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes().lightTheme,
      routes: MainRoutes().routes,
    );
  }
}
