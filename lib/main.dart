import 'package:artwork_crack/ui/myapp.dart';
import 'package:artwork_crack/ui/pages/Controllers/states_control.dart';
import 'package:artwork_crack/ui/pages/Controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(LoginController());
  Get.put(ContenidoController());
  runApp(MyApp());
}
