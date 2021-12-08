import 'package:artwork_crack/domain/Controllers/authentication_controller.dart';
import 'package:artwork_crack/ui/pages/Authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override 
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu>{
  
AuthenticationController authenticationController = Get.find();
  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      print(e);
    }
  }

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
            _logout();
          },
          child: const Text('Cerrar sesión', style: TextStyle(fontSize: 20)
        ),
        )
       ]
      )
      );
  }
}
