import 'package:artwork_crack/ui/pages/Authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Ver perfíl', style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Modo nocturno', style: TextStyle(fontSize: 20)
        ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Get.to(()=> MyLogin());
          },
          child: const Text('Cerrar sesión', style: TextStyle(fontSize: 20)
        ),
        )
       ]
      )
      );
  }
}
