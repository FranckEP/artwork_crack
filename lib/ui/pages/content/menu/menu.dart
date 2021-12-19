import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/ui/pages/Authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:artwork_crack/ui/custom.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  AuthController authenticationController = Get.find();
  // _logout() async {
  //   try {
  //     print('cerrando sesion');
  //     await authenticationController.logOut();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Color poggers = CustomAppBar.pog;
  static Color two = Colors.orange.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      Container(
        width: 400,
        height: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),))),
      const SizedBox(height: 10),
      // ElevatedButton(
      //   onPressed: () {
          
      //   },
      //   child: const Text('Ver perfíl', style: TextStyle(fontSize: 20)),
      // ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () { 
          setState(() => CustomAppBar.pog = two);
          Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
        },
        child: const Text('Modo nocturno', style: TextStyle(fontSize: 20)),
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
         authenticationController.logOut();
        },
        child: const Text('Cerrar sesión', style: TextStyle(fontSize: 20)),
      )
    ]));
  }
}
