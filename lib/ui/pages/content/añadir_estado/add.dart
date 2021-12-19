
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/status_control.dart';
import 'package:artwork_crack/ui/pages/content/a%C3%B1adir_estado/widgets/cont_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class add extends StatelessWidget {
  const add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateController statusController = Get.find();
    TextEditingController contentEditController = TextEditingController();
    AuthController authController = Get.find();

    return Scaffold(
       floatingActionButton: //Center(
      //   child: Row(children: <Widget>[
      //     const SizedBox(
      //       width: 180, height: 10,
      //     ),
          FloatingActionButton(
            onPressed: () {
              statusController.addState(
                title: authController.nameUser,
                content: contentEditController.text,
                picUrl: 'https://media.admagazine.com/photos/618a6acbcc7069ed5077ca7f/master/w_1600%2Cc_limit/68704.jpg',
                uid: authController.currentUser!.id,
              );
              contentEditController.text = '';
            },
            child: const Icon(Icons.add, size: 45,),
          ),
      body: ContAdd(
        title: '',
        textFieldKey: const Key('tfc'),
        controllerEdit: contentEditController,
      ),
    );
  }
}
