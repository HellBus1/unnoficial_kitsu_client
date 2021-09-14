import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_object_controller.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_refresher_status.dart';
import 'package:unnoficial_kitsu_client/feature/auth/auth_controller.dart';
import 'package:unnoficial_kitsu_client/model/user.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';

class LoginController extends BaseObjectController<User> {
  final AuthController authController = AuthController.find;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signInWithEmailAndPassword() async {
    loadingState();
    await client.then((value) => value
            .login(emailController.text, passwordController.text)
            .validateStatus()
            .then((value) {
          authController.saveAuthData(
            user: value.result!.user!,
            token: value.result!.token!,
          );
          finishLoadData();
          authController.setAuth();
        }).handleError((onError) {
          finishLoadData(errorMessage: onError);
        }));
  }

  void bypassLogin() async {
    status = RefresherStatus.loading;
    update();
    await Future.delayed(Duration(seconds: 2));
    var user = User(
        id: 1,
        name: "suitmedian",
        email: emailController.text,
        gender: "none",
        status: "admin");
    authController.saveAuthData(user: user, token: "a");
    finishLoadData();
    authController.setAuth();
  }
}
