import 'package:flutter/material.dart';
import 'package:login_logout_email/services/auth/auth_gate.dart';
// import 'package:login_logout_email/services/auth/login_or_register.dart';
// import 'package:login_logout_email/pages/login_page.dart';
// import 'package:login_logout_email/pages/register_page.dart';
import 'package:login_logout_email/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      home: AuthGate(),
      theme: light,
      debugShowCheckedModeBanner: false,
    );
  }
}
