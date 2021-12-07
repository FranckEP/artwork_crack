import 'package:artwork_crack/domain/Controllers/authentication_controller.dart';
import 'package:artwork_crack/domain/Controllers/logincontroller.dart';
import 'package:artwork_crack/domain/Controllers/states_control.dart';
import 'package:artwork_crack/ui/myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  await Firebase.initializeApp();
  Get.put(LoginController());
  Get.put(ContenidoController());
  Get.put(AuthenticationController());
  runApp(MyApp());
}
