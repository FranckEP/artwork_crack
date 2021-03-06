import 'dart:math';

import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/firestore_images.dart';
import 'package:artwork_crack/domain/use_cases/controllers/location_control.dart';
import 'package:artwork_crack/ui/pages/content/ubicacion/widgets/custom_location.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workmanager/workmanager.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  ControllerFirestore controlp = Get.find();
  AuthController controluser = Get.find();
  ControllerUbicacion controlubicacion = Get.find();
  ControllerFirestore controlguardarloc = Get.find();

  @override
  void initState() {
    super.initState();
    controlubicacion.obtenerubicacion();
    _initNotificaciones();
    Workmanager().registerPeriodicTask(
      "1",
      "ObtenerUbicacionesPeriodicas",
    );
  }

  _initNotificaciones() async {
    final _plugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _plugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarLocation(
          context: context,
          picUrl: controluser.currentUser!.pictureUrl,
          tile: Text(
            'Ubicación',
          )),
      body: ListView(children: <Widget>[
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange.shade400),
                    child: SizedBox(
                      width: 270,
                      height: 100,
                      child: Obx(
                        () => Center(
                          child: Text(
                            'Lat: ${controlubicacion.locationlat}\nLon: ${controlubicacion.locationlo}\n${controluser.currentUser!.name}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange.shade400),
                  child: SizedBox(
                      child: IconButton(
                    onPressed: () {
                      print(controluser.nameUser);
                      controlubicacion.obtenerubicacion();
                      var ubicacion = <String, dynamic>{
                        'lat': controlubicacion.locationlat,
                        'lo': controlubicacion.locationlo,
                        'name': controluser.nameUser,
                        'uid': controluser.uid,
                      };
                      controlguardarloc.guardarubicacion(
                          ubicacion, controluser.uid);

                      displayNotification(
                          title: 'Cerca de Mí',
                          body:
                              '${controlubicacion.cercanos}  artistas cerca mi ubicación');
                    },
                    icon: Icon(Icons.ac_unit_outlined, size: 18.0),
                  )),
                ),
              ),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue.shade400),
              child: SizedBox(
                width: 380,
                height: 540,
                child: Obx(
                  () => (controlubicacion.locationlat != '')
                      ? getInfo(
                          context,
                          controlp.readLocations(),
                          controluser.uid,
                          controlubicacion.locationlat,
                          controlubicacion.locationlo)
                      : const Center(
                          child: Icon(Icons.accessibility_new),
                        ),
                )),
              ),
            ),
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controlubicacion.obtenerubicacion();
        },
        tooltip: 'Refrescar',
        child: const FaIcon(
          FontAwesomeIcons.searchLocation,
          color: Colors.black,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  displayNotification({required String title, required String body}) async {
    final _plugin = FlutterLocalNotificationsPlugin();
    print("doing test");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await _plugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }
}

@override
Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct, String uid,
    String lat, String lo) {
  return StreamBuilder(
    stream: ct,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? VistaLocations(
                  locations: snapshot.data!.docs, uid: uid, lat: lat, lo: lo)
              : Text('Sin Datos');

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaLocations extends StatelessWidget {
  final List locations;
  final String uid;
  final String lat;
  final String lo;
  const VistaLocations(
      {required this.locations,
      required this.uid,
      required this.lat,
      required this.lo});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listacalculo = [];
    ControllerUbicacion controlubicacion = Get.find();

    //*********Calculo de Distancias***********//
    double deg2rad(double deg) {
      return (deg * pi / 180.0);
    }

    double rad2deg(double rad) {
      return (rad * 180.0 / pi);
    }

    String distance(
        double lat1, double lon1, double lat2, double lon2, String unit) {
      double theta = lon1 - lon2;
      double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
          cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
      dist = acos(dist);
      dist = rad2deg(dist);
      dist = dist * 60 * 1.1515;
      if (unit == 'K') {
        dist = dist * 1.609344;
      } else if (unit == 'N') {
        dist = dist * 0.8684;
      }
      return dist.toStringAsFixed(2);
    }

    //**********************************//
    for (int i = 0; i < locations.length; i++) {
      if (uid != locations[i]['uid']) {
        String distancia = distance(
            double.parse(lat),
            double.parse(lo),
            double.parse(locations[i]['lat']),
            double.parse(locations[i]['lo']),
            'K');

        var calc = <String, dynamic>{
          'name': locations[i]['name'],
          'lat': locations[i]['lat'],
          'lo': locations[i]['lo'],
          'Dist': distancia
        };
        // if (double.parse(distancia) < 500) listacalculo.add(calc);
        listacalculo.add(calc);
      }
    }

    listacalculo.sort((a, b) {
      return a['Dist'].compareTo(b['Dist']);
    });

    controlubicacion.cercanos = listacalculo.length.toString();

    return ListView.builder(
        itemCount: listacalculo.length == 0 ? 0 : listacalculo.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            leading: IconButton(
              onPressed: () async {
                final url =
                    "https://www.google.es/maps?q=${listacalculo[posicion]['lat']},${listacalculo[posicion]['lo']}";
                await launch(url);
              },
              icon: Icon(Icons.map_sharp, color: Colors.orange.shade400,),
            ),
            title: Text(
                'Lat:${listacalculo[posicion]['lat']} Lo: ${listacalculo[posicion]['lo']}'),
            subtitle: Text(listacalculo[posicion]['name']),
            trailing: Container(
              width: 45,
              height: 20,
              color: Colors.orange,
              child: Text(listacalculo[posicion]['Dist']),
            ),
          );
        });
  }
}
