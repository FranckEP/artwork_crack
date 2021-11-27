import 'package:artwork_crack/ui/pages/content/arte_social/widgets/cont_social.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class socialCard extends StatelessWidget {
  final String title, imagenicon, imagen; 

  const socialCard({
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
      topLeftWidget: SizedBox(
        height: 48.0,
        width: 48.0,
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundImage: NetworkImage(imagenicon),
            ),
        ),
      ),
      topRightWidget: const LikeButton(),
    );
  }
} 