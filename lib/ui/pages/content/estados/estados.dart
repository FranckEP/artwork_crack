import 'package:artwork_crack/ui/pages/content/estados/widgets/estadoscard.dart';
import 'package:flutter/material.dart';

class Estados extends StatefulWidget {
  const Estados({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Estados> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return const StateCard(
          title: 'Juan Pérez', 
          content: 'Hice un nuevo arte, vayan a mi perfíl o a la zona de arte social a verlo.',
          picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
        );
      }
    );
  }
  
}