import 'dart:developer';

import 'package:artwork_crack/data/repositories/firestore_database.dart';
import 'package:artwork_crack/data/services/locationservice.dart';
import 'package:artwork_crack/domain/models/location.dart';
import 'package:artwork_crack/domain/use_cases/controllers/connectivity_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/location_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/logincontroller.dart';
import 'package:artwork_crack/domain/use_cases/controllers/notification_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/permiso_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/status_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/ui.dart';
import 'package:artwork_crack/domain/use_cases/management_auth.dart';
import 'package:artwork_crack/domain/use_cases/management_location.dart';
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
  Get.put(AuthController());
  Get.put(UIController());
  
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
  
  Get.put(LocationController());
    // Notification controller
    NotificationController notificationController =
        Get.put(NotificationController());
    notificationController.initialize();

  Get.put(NotificationController());

  
  runApp(MyApp());
}

void updatePositionInBackground() async {
  final manager = LocationManager();
  final service = LocationService();
  Workmanager().executeTask((task, inputData) async {
    final position = await manager.getCurrentLocation();
    final details = await manager.retrieveUserDetails();
    var location = MyLocation(
        name: details['name']!,
        id: details['uid']!,
        lat: position.latitude,
        long: position.longitude);
    await service.fecthData(
      map: location.toJson,
    );
    log("updated location background"); //simpleTask will be emitted here.
    print("updated location background"); //simpleTask will be emitted here.
    return Future.value(true);
  });
}
