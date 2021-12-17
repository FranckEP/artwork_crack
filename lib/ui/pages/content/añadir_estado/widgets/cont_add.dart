import 'package:flutter/material.dart';

class ContAdd extends StatelessWidget {
  final Widget? content; 
  final String title;
  final TextEditingController controllerEdit;
  final Key? textFieldKey;

  const ContAdd({ 
    required this.title, 
    this.content,
    required this.controllerEdit,
    required this.textFieldKey,
});
  
  @override 
  Widget build(BuildContext context){
    return Column(
          children: [
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  TextField(
                    key: textFieldKey, controller: controllerEdit,
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: "¡Escribe tú nuevo estado aquí!",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ]
              ),
            ),
          ]
        );
  }
}