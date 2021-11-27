import 'package:artwork_crack/ui/pages/content/arte_social/widgets/socialcard.dart';
import 'package:flutter/material.dart';

class arteSocial extends StatefulWidget {
  const arteSocial({Key? key}) : super(key: key);

  @override
  _arteSocialState createState() => _arteSocialState();
}

class _arteSocialState extends State<arteSocial> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return const socialCard(
          title: 'Franck Peñaloza', 
          imagenicon: 'https://uifaces.co/our-content/donated/4l5I7teR.jpg',
          imagen: 'https://media.admagazine.com/photos/618a6acbcc7069ed5077ca7f/master/w_1600%2Cc_limit/68704.jpg',
        );
      },
    );
  }
}