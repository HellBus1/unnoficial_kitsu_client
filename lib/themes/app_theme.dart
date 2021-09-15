import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:unnoficial_kitsu_client/resources/resources.dart';

class StaticColor {
  static const bottomNavColor = Color.fromRGBO(19, 18, 18, 1);
}

class AppTheme {
  static ThemeData buildThemeData(bool darkMode) {
    return ThemeData(
      primaryColor: Resources.color.colorPrimary,
      accentColor: Resources.color.colorAccent,
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Resources.color.colorPrimary,
            secondary: Resources.color.colorPrimary,
          ),
      brightness: (darkMode) ? Brightness.light : Brightness.light,
      scaffoldBackgroundColor:
          (darkMode) ? Resources.color.black : Resources.color.white,
      backgroundColor:
          (darkMode) ? Resources.color.black : Resources.color.white,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      appBarTheme: (darkMode) ? darkAppBar() : lightAppBar(),
      // fontFamily: 'Lato',
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: Resources.color.colorPrimary,
      )),
      bottomNavigationBarTheme:
          (darkMode) ? darkNavigation() : lightNavigation(),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white), // Navbar
        headline2: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white), // Banner
        headline3: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black), // Normal
        headline4: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: Colors.black),
        headline5: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black54), // SubNormal
        headline6: TextStyle(
            fontSize: 14.sp,
            color: Resources.color.colorPrimary,
            fontWeight: FontWeight.w500),
        bodyText1: TextStyle(fontSize: 12.sp, color: Colors.black87),
        bodyText2: TextStyle(
            fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.w600),
        button: TextStyle(fontSize: 14.sp, color: Colors.white),
      ),
      inputDecorationTheme: inputDecoration(darkMode),
    );
  }

  static AppBarTheme lightAppBar() {
    return AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      color: Colors.white,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData lightNavigation() {
    return BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.deepOrangeAccent,
      elevation: 0,
    );
  }

  static AppBarTheme darkAppBar() {
    return AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      color: Colors.black,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData darkNavigation() {
    return BottomNavigationBarThemeData(
      backgroundColor: StaticColor.bottomNavColor,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      elevation: 0,
    );
  }

  // Box Field
  static inputDecoration(bool darkMode) {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[50],
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Resources.color.borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Resources.color.borderColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: Resources.color.red.withOpacity(0.8), width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Resources.color.red, width: 1.4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Resources.color.colorPrimary, width: 1),
      ),
      labelStyle: TextStyle(
        color: darkMode ? Resources.color.white : Resources.color.black,
      ),
      hintStyle: TextStyle(color: Resources.color.subHintColor, fontSize: 12),
    );
  }
}
