import 'package:flutter/material.dart';
import 'package:islamic/app_colors.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.bottom_nav_color,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.blackcolor,
        unselectedItemColor: AppColors.white_color,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.blackcolor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
            color: AppColors.blackcolor,
            fontSize: 25,
            fontWeight: FontWeight.w700),
        bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ));
}
