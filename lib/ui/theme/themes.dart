import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class MyTheme {

  static ThemeData get ligthTheme {
    return ThemeData(
      primarySwatch: AppColors.CreateMaterialColor(AppColors.primaryColor),
      colorScheme: AppColors.lightScheme,
      fontFamily: AppTextStyle.fontFamily,
      textTheme: AppTextStyle.textTheme,
      cardTheme: const CardTheme(
        color: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey.shade500,
        selectedItemColor: AppColors.lightScheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        fillColor: Colors.grey.shade300,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: AppColors.CreateMaterialColor(AppColors.primaryColor),
      colorScheme: AppColors.darkScheme,
      toggleableActiveColor: AppColors.darkScheme.secondary,
      // this can all be copied, waiting for verification
      fontFamily: AppTextStyle.fontFamily,
      textTheme: AppTextStyle.textTheme.copyWith(
        bodyText1: AppTextStyle.appBodyText.copyWith(
          color: Colors.white70,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: AppColors.lightScheme.primary,
      ),
      // copy from ligthTheme
      inputDecorationTheme: ligthTheme.inputDecorationTheme,
    );
  }

}