import 'package:artwork_crack/ui/myapp.dart';
import 'package:artwork_crack/ui/pages/Controllers/states_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(
    ContenidoController()
  );
  runApp(const MyApp());
}

