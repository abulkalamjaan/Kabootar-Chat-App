import 'package:get/get.dart';
import 'package:my_first_flutter_project/controllers/auth.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
