import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_first_flutter_project/controllers/bindings.dart';

import 'package:my_first_flutter_project/resources/themes.dart';
import 'package:my_first_flutter_project/routes/main_routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes().lightTheme,
      transitionDuration: const Duration(seconds: 1),
      defaultTransition: Transition.downToUp,
      routes: MainRoutes().routes,
      initialBinding: AppBindings(),
    );
  }
}
