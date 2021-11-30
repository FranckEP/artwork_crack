import 'package:artwork_crack/ui/pages/content/estados/widgets/cont_estados.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class StateCard extends StatelessWidget { 
  final String title, content, picUrl;
  const StateCard( 
    {Key? key, 
    required this.title, 
    required this.content, 
    required this.picUrl,}) 
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: title,
      content: Text(
        content, style: const TextStyle(color: Colors.white, fontSize: 18,), 
      ),
      topLeftWidget: SizedBox(
        height: 48.0,
        width: 48.0,
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundImage: NetworkImage(picUrl),
            ),
        ),
      ),
      topRightWidget: const LikeButton(),
    );
  }
}