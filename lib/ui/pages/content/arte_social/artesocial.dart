import 'package:artwork_crack/ui/pages/Controllers/states_control.dart';
import 'package:artwork_crack/ui/pages/content/arte_social/widgets/socialcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class arteSocial extends StatefulWidget {
  const arteSocial({Key? key}) : super(key: key);

  @override
  _arteSocialState createState() => _arteSocialState();
}

class _arteSocialState extends State<arteSocial> {

  @override
  Widget build(BuildContext context) {
    return GetX<ContenidoController>(
      builder:(controller){
        return ListView.builder(
        itemCount: controller.listStates.length,
        itemBuilder: (context, index){
          return socialCard(
            title: controller.listArte[index][0], 
            imagen: controller.listArte[index][1], 
            imagenicon: controller.listArte[index][2],
          );
        }
      );
      }
    );
  }
}