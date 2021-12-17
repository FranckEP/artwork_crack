import 'package:artwork_crack/domain/use_cases/controllers/status_control.dart';
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
    return GetX<StateController>(
      builder:(controller){
        return ListView.builder(
        itemCount: controller.listState.length,
        itemBuilder: (context, index){
          return StateCard(
            title: controller.listState[index].title, 
            content: controller.listState[index].content,
            picUrl: controller.listState[index].picUrl,
          );
        }
      );
      }
    );
  }
  
}