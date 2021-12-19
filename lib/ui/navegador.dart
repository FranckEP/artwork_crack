import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/logincontroller.dart';
import 'package:artwork_crack/domain/use_cases/controllers/ui.dart';
import 'package:artwork_crack/ui/custom.dart';
import 'package:artwork_crack/ui/pages/content/a%C3%B1adir_estado/add_states.dart';
import 'package:artwork_crack/ui/pages/content/arte_social/artesocial.dart';
import 'package:artwork_crack/ui/pages/content/chatsContent/user_messages1.dart';
import 'package:artwork_crack/ui/pages/content/estados/states_screen.dart';
import 'package:artwork_crack/ui/pages/content/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color poggers = CustomAppBar.pog;
  static Color two = Colors.orange.withOpacity(0.5);

  static final List<Widget> _widgetOptions = <Widget>[
    ListaEstados(),
    UserMessages(),
    AgregarEstado(),
    arteSocial(),
    Menu(),
  ];

  AuthController authenticationController = Get.find();
  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    UIController uiController = Get.find();
    return GetX<LoginController>(
      builder:(controller){
      return Scaffold(
        appBar: CustomAppBar(
          context: context,
          tile: Text(controller.user),
          picUrl: 'https://media.admagazine.com/photos/618a6acbcc7069ed5077ca7f/master/w_1600%2Cc_limit/68704.jpg',
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.blur_circular_outlined,
                color: Color(0xff68CAF0),
              ),
              label: 'Estados',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message_outlined,
                color: Color(0xff68CAF0),
              ),
              label: 'Mensajes',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_outlined,
                color: Color(0xff68CAF0),
              ),
              label: 'Nuevo',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera_back_outlined,
                color: Color(0xff68CAF0),
              ),
              label: 'Arte Social',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                color: Color(0xff68CAF0),
              ),
              label: 'Menú',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xffF4AC47),
          unselectedItemColor: const Color(0xff3A434D),
        ),
      );
    }
    );
  }
}
