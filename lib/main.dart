import 'package:artwork_crack/data/repositories/firestore_database.dart';
import 'package:artwork_crack/domain/use_cases/controllers/logincontroller.dart';
import 'package:artwork_crack/domain/use_cases/controllers/states_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/ui.dart';
import 'package:artwork_crack/domain/use_cases/managament_auth.dart';
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
  Get.put(AuthManagement());
  Get.put(FirestoreDatabase());
  Get.put(AuthController());
  Get.put(UIController());
  runApp(MyApp());
}
