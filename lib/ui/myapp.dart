import 'package:artwork_crack/ui/firebase_central.dart';
import 'package:artwork_crack/ui/pages/Authentication/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'theme/themes.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
