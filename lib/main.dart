import 'dart:developer';

import 'package:artwork_crack/data/repositories/chat_repo_data/realtime_database.dart';
import 'package:artwork_crack/data/repositories/firestore_database.dart';
import 'package:artwork_crack/data/services/locationservice.dart';
import 'package:artwork_crack/domain/models/location.dart';
import 'package:artwork_crack/domain/use_cases/controllers/connectivity_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/firestore_images.dart';
import 'package:artwork_crack/domain/use_cases/controllers/location_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/logincontroller.dart';
import 'package:artwork_crack/domain/use_cases/controllers/notification_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/permiso_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/status_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/ui.dart';
import 'package:artwork_crack/domain/use_cases/management_auth.dart';
import 'package:artwork_crack/domain/use_cases/management_chat.dart';
import 'package:artwork_crack/domain/use_cases/management_permiso.dart';
import 'package:artwork_crack/domain/use_cases/management_states.dart';
import 'package:artwork_crack/ui/myapp.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:workmanager/workmanager.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  await Firebase.initializeApp();
  Get.put(LoginController());
  Get.put(StatusManager());
  Get.put(StateController());
  Get.put(AuthManagement());
  Get.put(FirestoreDatabase());
  Get.put(ControllerFirestore());
  Get.put(AuthController());
  Get.put(UIController());
  Get.put(RealTimeChat());
  Get.put(ChatManager());
  
  PermissionsController permissionsController =
        Get.put(PermissionsController());
    permissionsController.permissionManager = PermissionManager();
  
  ConnectivityController connectivityController =
        Get.put(ConnectivityController());
    // Connectivity stream
    Connectivity().onConnectivityChanged.listen((connectivityStatus) {
      log("connection changed");
      connectivityController.connectivity = connectivityStatus;
    });
  
  Get.put(ControllerUbicacion());
    // Notification controller
    NotificationController notificationController =
        Get.put(NotificationController());
    notificationController.initialize();

  Get.put(NotificationController());

  
  runApp(MyApp());
}

