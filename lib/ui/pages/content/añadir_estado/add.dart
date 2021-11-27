import 'package:flutter/material.dart';
import 'package:artwork_crack/ui/custom.dart';

class add extends StatelessWidget {
  const add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context, 
        tile: const Text('ArtWork Crack', 
          textAlign: TextAlign.left, 
          style: TextStyle(
            color: Color(0xff3A434D),
          ),
        ), 
        picUrl: 'https://uifaces.co/our-content/donated/2Stzj6r-.jpg',
        ),
    );
  }
}