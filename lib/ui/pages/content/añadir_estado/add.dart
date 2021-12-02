import 'package:artwork_crack/ui/pages/Controllers/states_control.dart';
import 'package:artwork_crack/ui/pages/content/a%C3%B1adir_estado/widgets/cont_add.dart';
import 'package:flutter/material.dart';
import 'package:artwork_crack/ui/custom.dart';
import 'package:get/get.dart';

class add extends StatelessWidget {
  const add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContenidoController statusController = Get.find();
    TextEditingController contentEditController = TextEditingController();
    TextEditingController contentArteController = TextEditingController();

    return Scaffold(
      floatingActionButton: Positioned(
        width: MediaQuery.of(context).size.width,
        child: Row(children: <Widget>[
          const SizedBox(
            width: 80,
          ),
          FloatingActionButton(
            onPressed: () {
              statusController.addStates([
                'Juan Pérez',
                contentEditController.text,
                'https://uifaces.co/our-content/donated/gPZwCbdS.jpg'
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
                'Franck Peñaloza',
                contentArteController.text,
                'https://uifaces.co/our-content/donated/gPZwCbdS.jpg'
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
