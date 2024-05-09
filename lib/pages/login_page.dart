
import 'package:flutter/material.dart';
import 'package:login_logout_email/services/auth/auth_service.dart';
import 'package:login_logout_email/util/mybtn.dart';
import 'package:login_logout_email/util/mytextfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final AuthService _authService = AuthService();
  bool isDarkMode = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            e.toString(),
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        
        appBar: AppBar(
          
          title: Text("Login"),
          centerTitle: true,
          actions: [
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 100.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  MyTextField(
                    hinttext: "Enter Email",
                    pass: false,
                    controller: _emailController,
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    hinttext: "Enter Password",
                    pass: true,
                    controller: _passController,
                  ),
                  SizedBox(height: 30),
                  MyBtn(
                    text: "Login",
                    onTap: () {
                      login(context);
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a Member? ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
