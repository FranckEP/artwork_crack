import 'package:artwork_crack/domain/use_cases/controllers/ui.dart';
import 'package:artwork_crack/domain/use_cases/management_theme.dart';
import 'package:artwork_crack/ui/firebase_central.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'theme/themes.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _stateManagementInit();
    return GetMaterialApp(
      home: FirebaseCentral(),
      debugShowCheckedModeBanner: false,
      theme: MyTheme
            .ligthTheme, // Apply the theme referenced by the theme property on
        // MaterialApp
        darkTheme:
            MyTheme.darkTheme, // Apply the theme referenced by the darkTheme
        // property on MaterialApp
        themeMode:
            ThemeMode.system,
    );
  }

  void _stateManagementInit() {
    UIController uiController = Get.put(UIController());
    uiController.themeManager = ThemeManager();

    ever(uiController.reactiveBrightness, (bool isDarkMode) {
      uiController.manager.changeTheme(isDarkMode: isDarkMode);
    });
  }
}
