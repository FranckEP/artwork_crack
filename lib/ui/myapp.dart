import 'package:artwork_crack/ui/navegador.dart';
import 'package:artwork_crack/ui/pages/content/login/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyLogin(),
      );
  }
}