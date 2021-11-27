import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget tile; 
  final BuildContext context; 
  final String picUrl; 

  CustomAppBar({
    Key? key, 
    required this.context, 
    required this.tile,  
    required this.picUrl,
  }) : super(
    key: key,
    centerTitle: true,
    leading: Center(
      child: CircleAvatar(
        minRadius: 18.0,
        maxRadius: 18.0,
        backgroundImage: NetworkImage(picUrl),
        ),
    ),
    title: tile,
    backgroundColor: Colors.white,
  );

}