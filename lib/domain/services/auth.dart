import 'package:artwork_crack/domain/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthInterface {
  Future<bool> signUp(
      {required userModel});

  Future<UserModel?> signIn(
      {required String email, required String password});

  Future<bool> signOut();

  static Stream<User?> get authStream =>
      FirebaseAuth.instance.authStateChanges();
}