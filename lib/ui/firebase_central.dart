import 'package:artwork_crack/ui/pages/Authentication/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'navegador.dart';

class FirebaseCentral extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ContentPage();
        } else {
          return MyLogin();
        }
      },
    );
  }
}