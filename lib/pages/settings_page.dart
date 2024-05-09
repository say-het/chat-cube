import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_email/services/auth/auth_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService _authService = AuthService();
  void resetPass(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null && user.email != null) {
      _authService.resetPassword(email: user.email.toString());
    } else {
      print("User not authenticated or email address not found");
    }
  }

  void deleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure?"),
          content: Text("This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                AuthService().signOut();
                await AuthService().deleteAccount();
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => deleteAccount(context),
              child: Text("Delete Account"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => resetPass(context),
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
