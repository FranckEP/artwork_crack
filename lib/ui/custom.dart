import 'package:artwork_crack/domain/use_cases/controllers/ui.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget tile;
  final BuildContext context;
  final String picUrl;
  static Color pog = Colors.blue.withOpacity(0.5);

  CustomAppBar( {
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
          backgroundColor: pog,
          shadowColor: Colors.transparent,
          
        );
}