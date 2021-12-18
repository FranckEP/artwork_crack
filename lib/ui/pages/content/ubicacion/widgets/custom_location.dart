import 'package:artwork_crack/ui/pages/content/ubicacion/screen_ubicacion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarLocation extends AppBar {
  final Widget tile;
  final BuildContext context;
  final String picUrl;
  static Color pog = Colors.blue.withOpacity(0.5);

  CustomAppBarLocation( {
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
              Get.back();},
            icon: const Icon(Icons.arrow_back_ios))
          ]
        );
}