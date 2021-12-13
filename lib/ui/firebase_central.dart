import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/ui/pages/Authentication/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'navegador.dart';

class FirebaseCentral extends StatelessWidget {
  FirebaseCentral({Key? key}) : super(key: key);

  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
         (){
          print(controller.isLogged.value);
          if (controller.isLogged.value == true) {
            print('Hola');
            return const ContentPage();
          } else {
            return MyLogin();
          }
        },
    );
  }
}
