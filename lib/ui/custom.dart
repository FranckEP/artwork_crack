import 'package:artwork_crack/ui/pages/content/ubicacion/screen_ubicacion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          actions: <Widget>[
            IconButton(onPressed:() {
              Get.to(() => Locations());}, 
            icon: const Icon(Icons.location_pin))
          ]
        );
}