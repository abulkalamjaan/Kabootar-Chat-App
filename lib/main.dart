import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:my_first_flutter_project/pages/welcome.dart';
import 'package:my_first_flutter_project/resources/themes.dart';
import 'package:my_first_flutter_project/routes/main_routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
