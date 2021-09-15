import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'initializer.dart';
import 'routes/page_names.dart';
import 'routes/page_routes.dart';
import 'themes/app_theme.dart';
import 'utills/localization/app_translation.dart';
import 'utills/localization/locale_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  await Initializer.initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppTranslation(),
        locale: LocaleHelper().getCurrentLocale(),
        fallbackLocale: LocaleHelper().fallbackLocale,
        initialRoute: PageName.DASHBOARD,
        getPages: PageRoutes.pages,
        theme: AppTheme.buildThemeData(true),
      );
    });
  }
}
