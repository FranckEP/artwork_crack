import 'package:flutter/material.dart';

class ContAdd extends StatelessWidget { 
  final Widget? content; 
  final String title;
  final TextEditingController controllerEdit, controllerArte;
  final Key? textFieldKey, linkFieldKey;

  const ContAdd({ 
    required this.title, 
    this.content,
    required this.controllerEdit,
    required this.textFieldKey,
    required this.controllerArte,
    required this.linkFieldKey});
  
  @override 
  Widget build(BuildContext context){
    return Column(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                key: textFieldKey, controller: controllerEdit,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "¡Escribe tú nuevo estado aquí!",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ]
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                key: linkFieldKey, controller: controllerArte,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "¡Ingresa el link de tu nuevo arte aquí!",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ]
          ),
        )
      ]
    );
  }

}
