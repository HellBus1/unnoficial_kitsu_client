import 'package:flutter/material.dart';

class Resources {
  static AppColors color = AppColors();
  static AppImages images = AppImages();
}

class AppColors {
  Color colorPrimary = Colors.deepOrange;
  Color colorSecondary = Colors.deepOrangeAccent;
  Color colorAccent = Colors.white;
  Color black = Colors.black;
  Color white = Colors.white;
  Color grey = Colors.grey;
  Color red = Colors.red;
  Color borderColor = Colors.black12;
  Color subHintColor = Colors.black45;
}

class AppImages {
  AssetImage imageLogo =
      AssetImage('lib/resources/images/ic_logo_suitcore_main.png');
  AssetImage imageEmpty = AssetImage('lib/resources/images/img_empty.png');
  AssetImage imageError = AssetImage('lib/resources/images/img_error.png');
  AssetImage userPlaceholder =
      AssetImage('lib/resources/images/user_placeholder.png');
}
