import 'package:artwork_crack/domain/Controllers/states_control.dart';
import 'package:artwork_crack/ui/pages/content/estados/widgets/estadoscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Estados extends StatefulWidget {
  const Estados({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Estados> {

  @override
  Widget build(BuildContext context) {
    return GetX<ContenidoController>(
      builder:(controller){
        return ListView.builder(
        itemCount: controller.listStates.length,
        itemBuilder: (context, index){
          return StateCard(
            title: controller.listStates[index][0], 
            content: controller.listStates[index][1],
            picUrl: controller.listStates[index][2],
          );
        }
      );
      }
    );
  }
  
}