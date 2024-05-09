import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_email/services/auth/login_or_register.dart';
import 'package:login_logout_email/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (FirebaseAuth.instance.currentUser != null) {
                return HomePage(
                  email: FirebaseAuth.instance.currentUser!.email ?? "",
                );
              }
            }
            return LoginOrRegister();
          }),
    );
  }
}
