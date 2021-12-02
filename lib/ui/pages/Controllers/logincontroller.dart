import 'package:get/get.dart';

class LoginController extends GetxController {
  var _user = "Juan Perez".obs;
  var _estadoUser = "".obs;

  String get user => _user.value;
  String get estadoUser => _estadoUser.value;

  asignarUsuario(var usuario) {
    _user.value = usuario;
  }
}
