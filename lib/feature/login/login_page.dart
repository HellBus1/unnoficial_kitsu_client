import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unnoficial_kitsu_client/feature/auth/auth_controller.dart';
import 'package:unnoficial_kitsu_client/resources/resources.dart';
import 'package:unnoficial_kitsu_client/utills/helper/validator.dart';
import 'package:unnoficial_kitsu_client/utills/widget/forms/form_input_field_with_icon.dart';
import 'package:unnoficial_kitsu_client/utills/widget/primary_button.dart';
import 'package:unnoficial_kitsu_client/utills/widget/statefull_wrapper.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = AuthController.find;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async {
        var storage = await Permission.storage.status;
        if (storage.isDenied) {
          await Permission.storage.request();
        }
      },
      child: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Image(
                                image: Resources.images.imageLogo,
                                color: Resources.color.colorPrimary,
                              ),
                            ),
                            SizedBox(height: 48.0),
                            FormInputFieldWithIcon(
                              enabled: !controller.isLoading,
                              controller: controller.emailController,
                              iconPrefix: Icons.email,
                              labelText: 'txt_email'.tr,
                              validator: Validator().email,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) => null,
                              onSaved: (value) =>
                                  controller.emailController.text = value!,
                            ),
                            FormVerticalSpace(),
                            FormInputFieldWithIcon(
                              enabled: !controller.isLoading,
                              controller: controller.passwordController,
                              iconPrefix: Icons.lock,
                              labelText: 'txt_password'.tr,
                              validator: Validator().password,
                              obscureText: true,
                              onChanged: (value) => null,
                              onSaved: (value) =>
                                  controller.passwordController.text = value!,
                              maxLines: 1,
                            ),
                            FormVerticalSpace(height: 48),
                            controller.isLoading
                                ? CircularProgressIndicator()
                                : Container(),
                            controller.isLoading
                                ? Container()
                                : PrimaryButton(
                                    title: 'txt_button_login'.tr,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        controller.signInWithEmailAndPassword();
                                      }
                                    }),
                            FormVerticalSpace(height: 20),
                            controller.isLoading
                                ? Container()
                                : PrimaryButton(
                                    title: 'Skip',
                                    reverse: true,
                                    onPressed: () async {
                                      controller.bypassLogin();
                                    }),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormVerticalSpace extends SizedBox {
  FormVerticalSpace({double height = 24.0}) : super(height: height);
}
