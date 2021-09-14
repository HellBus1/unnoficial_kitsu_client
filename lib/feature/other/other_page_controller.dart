import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/auth/auth_controller.dart';
import 'package:unnoficial_kitsu_client/model/user.dart';

class OtherController extends GetxController {
  final AuthController authController = AuthController.find;

  User? get user => authController.user;

  Future<void> signOut() async {
    await authController.signOut();
  }
}
