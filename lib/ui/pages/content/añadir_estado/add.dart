
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/states_control.dart';
import 'package:artwork_crack/domain/use_cases/managament_auth.dart';
import 'package:artwork_crack/ui/pages/content/a%C3%B1adir_estado/widgets/cont_add.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class add extends StatelessWidget {
  const add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContenidoController statusController = Get.find();
    TextEditingController contentEditController = TextEditingController();
    TextEditingController contentArteController = TextEditingController();
    AuthController authController = Get.find();

    return Scaffold(
      floatingActionButton: Positioned(
        width: MediaQuery.of(context).size.width,
        child: Row(children: <Widget>[
          const SizedBox(
            width: 90,
          ),
          FloatingActionButton(
            onPressed: () {
              statusController.addStates([
                authController.nameUser,
                contentEditController.text,
                'https://media.admagazine.com/photos/618a6acbcc7069ed5077ca7f/master/w_1600%2Cc_limit/68704.jpg'
              ]);
              contentEditController.text = '';
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 150,
          ),
          FloatingActionButton(
            onPressed: () {
              statusController.addArte([
                authController.nameUser,
                contentArteController.text,
                'https://media.admagazine.com/photos/618a6acbcc7069ed5077ca7f/master/w_1600%2Cc_limit/68704.jpg'
              ]);
              contentArteController.text = '';
            },
            child: const Icon(Icons.add_a_photo),
          ),
        ]),
      ),
      body: ContAdd(
        title: '',
        textFieldKey: const Key('tfc'),
        controllerEdit: contentEditController,
        controllerArte: contentArteController,
        linkFieldKey: const Key('tfc'),
      ),
    );
  }
}
