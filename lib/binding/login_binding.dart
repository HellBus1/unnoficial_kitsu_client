import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
