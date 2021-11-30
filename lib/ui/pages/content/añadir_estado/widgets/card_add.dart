import 'package:artwork_crack/ui/pages/content/arte_social/widgets/cont_social.dart';
import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  final String title, imagenicon, imagen; 

  const SocialCard({
    Key? key,
    required this.title, 
    required this.imagenicon,
    required this.imagen,   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: title,
      content: Image.network(imagen),
    );
  }
}