import 'dart:developer';

import 'package:artwork_crack/data/repositories/firestore_database.dart';
import 'package:artwork_crack/domain/models/user.dart';
import 'package:artwork_crack/domain/repositories/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PasswordAuth implements AuthInterface {

  Future<UserModel?> getLoggedUser()async{
    var fUser = FirebaseAuth.instance.currentUser;
    if (fUser != null) {
      FirestoreDatabase firestoreDatabase = Get.find();
          var doc = await firestoreDatabase.getDocWithId(colletionName: 'users', idDoc: fUser.uid);
          return UserModel.fromJson(doc!);
    }else{
      return null;
    }
  }
  @override
  Future<UserModel?> signIn({required String email, required String password}) async {
    try {
      var userCredential = 
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
          /*FirestoreDatabase firestoreDatabase = Get.find();
           var doc = await firestoreDatabase.getDocWithId(colletionName: 'users', idDoc: userCredential.user!.uid);
          return UserModel.fromJson(doc!);*/
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Usuario no encontrado",
          "No se encontró un usuario que use ese email.",
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Contraseña equivocada",
          "La contraseña proveida por el usuario no es correcta.",
        );
      }
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<bool> signUp(
      {required userModel}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userModel.email, password: userModel.password);
      userCredential.user!.updateDisplayName(userModel.name);
      FirestoreDatabase firestoreDatabase = Get.find();
      Map<String, dynamic> doc = userModel.toJson();
      doc.addAll({
        'id': userCredential.user?.uid
      });
      firestoreDatabase.add(collectionPath: 'users', data: doc);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Contraseña insegura",
          "La seguridad de la contraseña es muy débil",
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Email inválido",
          "Ya existe un usuario con este correo electrónico.",
        );
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  // We throw an error if someone calls SignInWithGoogle, member of AuthInterface
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}