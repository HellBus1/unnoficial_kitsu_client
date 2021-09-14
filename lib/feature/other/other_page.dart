import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/utills/localization/locale_helper.dart';
import 'package:unnoficial_kitsu_client/utills/widget/forms/form_image_picker.dart';

import 'other_page_controller.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherController>(
      init: OtherController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('txt_menu_other'.tr),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FormImagePicker(name: 'profile_pict'),
                    SizedBox(height: 32),
                    Text(
                      controller.user?.name ?? '',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        LocaleHelper().showLocaleDialog(context);
                      },
                      child: Text('txt_button_change_locale'.tr),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.signOut();
                      },
                      child: Text('txt_button_logout'.tr),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
