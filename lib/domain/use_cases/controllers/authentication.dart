import 'package:artwork_crack/domain/models/user.dart';
import 'package:artwork_crack/domain/use_cases/management_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Observables
  final _authenticated = false.obs;
  final _currentUser = Rx<UserModel?>(null);
  final _nameUser = "".obs;
  late AuthManagement _manager;
  var isLogged = false.obs;

  String get nameUser => _nameUser.value;

  AuthController(){
    _manager = Get.find();
    getLoggedUser();
  }

  Future<void> usuario(
      {required String email, required String password}) async {
    var userCredential = FirebaseAuth.instance.currentUser!.displayName;
    print(userCredential);
    guardarUser(userCredential!);
  }

  guardarUser(String usuario){
    _nameUser.value = usuario;
  }

  getLoggedUser()async{
    _currentUser.value = await _manager.getLoggedUser();
  }

  set currentUser(UserModel? userAuth) {
    _currentUser.value = userAuth;
    _authenticated.value = userAuth != null;
  }

  set authManagement(AuthManagement manager) {
    _manager = manager;
  }

  // Reactive Getters
  RxBool get reactiveAuth => _authenticated;
  Rx<UserModel?> get reactiveUser => _currentUser;

  // Getters
  bool get authenticated => _authenticated.value;
  UserModel? get currentUser => _currentUser.value;

  AuthManagement get manager => _manager;

  // Future<bool> login(email, password) async {
  //   try {
  //     _currentUser.value = await _manager.signIn(email: email, password: password);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<void> login(theEmail, thePassword) async {
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: theEmail, password: thePassword);
  //     print('OK');
  //     return Future.value(true);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('NOK 1');
  //       return Future.error("User not found");
  //     } else if (e.code == 'wrong-password') {
  //       print('NOK 2');
  //       return Future.error("Wrong password");
  //     }
  //   }
  //   print('NOK');
  // }

  Future<void> login(email, password) async {
    try {
        await _manager.signIn(email: email, password: password);
        isLogged.value = true;
    } catch (e) {
      isLogged.value = false;
    }
    printInfo(info: 'Ok');
  }

  Future<void> signUp({name, email, password}) async {
    try {
     await _manager.signUp(name: name, email: email, password: password);
    } catch (e) {
      Get.snackbar('Error en el registro', 'No ha sido posible conectar tus datos');
    }
  }

  Future<void> logOut() async {
    try {
      await manager.signOut();
      isLogged.value = false;
    } catch (e) {
      return Future.error(e);
    }
  }

  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }
}