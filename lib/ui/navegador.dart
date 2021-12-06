import 'package:artwork_crack/ui/custom.dart';
import 'package:artwork_crack/ui/pages/Controllers/logincontroller.dart';
import 'package:artwork_crack/ui/pages/content/a%C3%B1adir_estado/add.dart';
import 'package:artwork_crack/ui/pages/content/arte_social/artesocial.dart';
import 'package:artwork_crack/ui/pages/content/estados/estados.dart';
import 'package:artwork_crack/ui/pages/content/mensajes/listchat.dart';
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

  static const List<Widget> _widgetOptions = <Widget>[
    Estados(),
    ChatListPageView(),
    add(),
    arteSocial(),
    Menu(),
  ];

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return GetX<LoginController>(
      builder:(controller){
      return Scaffold(
        appBar: CustomAppBar(
          context: context,
          tile: Text(controller.user, style: const TextStyle(color: Color(0xff3A434D)),),
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
          backgroundColor: const Color(0xff3A434D),
          selectedItemColor: const Color(0xff68CAF0),
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
        ),
      );
    }
    );
  }
}
