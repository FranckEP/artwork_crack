import 'package:get/get.dart';

class LoginController extends GetxController {
  var _user = "Helmunt Hernandez".obs;
  var _estadoUser = "".obs;

  String get user => _user.value;
  String get estadoUser => _estadoUser.value;

  asignarUsuario(var usuario) {
    _user.value = usuario;
  }
}
