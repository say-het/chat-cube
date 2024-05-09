import 'package:flutter/material.dart';
import 'package:login_logout_email/pages/login_page.dart';
import 'package:login_logout_email/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool login = true;

  void togglePage() {
    setState(() {
      login = !login;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (login) {
      return LoginPage(
        onTap: togglePage,
      );
    } else {
      return RegisterPage(
        onTap: togglePage,
      );
    }
  }
}
