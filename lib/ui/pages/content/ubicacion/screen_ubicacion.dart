import 'package:artwork_crack/data/services/locationservice.dart';
import 'package:artwork_crack/domain/models/location.dart';
import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/connectivity_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/location_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/notification_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/permiso_control.dart';
import 'package:artwork_crack/domain/use_cases/controllers/ui.dart';
import 'package:artwork_crack/domain/use_cases/management_location.dart';
import 'package:artwork_crack/ui/pages/content/ubicacion/widgets/card_ubicacion.dart';
import 'package:artwork_crack/ui/pages/content/ubicacion/widgets/custom_location.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:get/get.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final permissionsController = Get.find<PermissionsController>();
  final connectivityController = Get.find<ConnectivityController>();
  final uiController = Get.find<UIController>();
  final locationController = Get.find<LocationController>();
  final notificationController = Get.find<NotificationController>();
  final service = LocationService();

  @override
  Widget build(BuildContext context) {
    final _id = authController.currentUser!.id;
    final _name = authController.currentUser!.name;
    _init(_id!, _name);
    return Scaffold(
        appBar: CustomAppBarLocation(
            context: context,
            tile: const Text('Ubicación'),
            picUrl:
                'https://media.admagazine.com/photos/618a6acbcc7069ed5077ca7f/master/w_1600%2Cc_limit/68704.jpg'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => locationController.location != null
                    ? LocationCard(
                        key: const Key("myLocationCard"),
                        title: 'MI UBICACIÓN',
                        lat: locationController.location!.lat,
                        long: locationController.location!.long,
                        onUpdate: () {
                          if (permissionsController.locationGranted &&
                              connectivityController.connected) {
                            _updatePosition(_id, _name);
                          }
                        },
                      )
                    : const CircularProgressIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'CERCA DE MÍ',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              // ListView on remaining screen space
              Obx(() {
                if (locationController.location != null) {
                  var futureLocations = service.fecthData(
                    map: locationController.location!.toJson,
                  );
                  return FutureBuilder<List<UserLocation>>(
                    future: futureLocations,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final items = snapshot.data!;
                        notificationController.show(
                            title: 'Usuarios cerca.',
                            body:
                                'Hay ${items.length} usuarios cerca de tu ubicación...');
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            UserLocation location = items[index];
                            return LocationCard(
                              title: location.name,
                              distance: location.distance,
                            );
                          },
                          // Avoid scrollable inside scrollable
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
            ],
          ),
        ));
  }

  _init(String uid, String name) {
    if (!permissionsController.locationGranted) {
      permissionsController.manager.requestGpsPermission().then((granted) {
        if (granted) {
          locationController.locationManager = LocationManager();
          _updatePosition(uid, name);
        } else {
          uiController.screenIndex = 0;
        }
      });
    } else {
      locationController.locationManager = LocationManager();
      _updatePosition(uid, name);
    }
    notificationController.createChannel(
        id: 'users-location',
        name: 'Users Location',
        description: 'Other users location...');
  }

  _updatePosition(String uid, String name) async {
    final position = await locationController.manager.getCurrentLocation();
    await locationController.manager.storeUserDetails(uid: uid, name: name);
    locationController.location = MyLocation(
        name: name, id: uid, lat: position.latitude, long: position.longitude);
    Workmanager().registerPeriodicTask(
      "1",
      "locationPeriodicTask",
    );
  }
}
