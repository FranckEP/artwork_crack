import 'package:artwork_crack/ui/custom.dart';
import 'package:artwork_crack/ui/pages/content/a%C3%B1adir_estado/add.dart';
import 'package:artwork_crack/ui/pages/content/arte_social/artesocial.dart';
import 'package:artwork_crack/ui/pages/content/estados/estados.dart';
import 'package:artwork_crack/ui/pages/content/mensajes/listchat.dart';
import 'package:artwork_crack/ui/pages/content/mensajes/mensajeschat.dart';
import 'package:artwork_crack/ui/pages/content/menu/menu.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState( () {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Estados(),
    ChatListPageView(),
    add(),
    arteSocial(),
    menu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff3A434D),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_circular_outlined, color: Colors.black,),
            label: 'Estados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, color: Colors.black,),
            label: 'Mensajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_outlined, color: Colors.black,),
            label: 'Nuevo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_back_outlined, color: Colors.black,),
            label: 'Arte Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.black,),
            label: 'Menú',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xff68CAF0),
        ),
    );
  }
}