import 'package:artwork_crack/domain/models/location.dart';
import 'package:artwork_crack/domain/use_cases/management_location.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  // Observables
  final _location = Rx<MyLocation?>(null);
  late LocationManager _manager;

  set locationManager(LocationManager manager) {
    _manager = manager;
  }

  set location(MyLocation? myLocation) {
    _location.value = myLocation;
  }

  // Getters
  LocationManager get manager => _manager;

  MyLocation? get location => _location.value;

  Rx<MyLocation?> get reactiveLocation => _location;
}