import 'package:flutter/material.dart';
import 'package:login_logout_email/services/auth/auth_service.dart';
import 'package:login_logout_email/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  // AuthService _auth = AuthService();
  void logout() {
    AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.message,
            color: Theme.of(context).colorScheme.primary,
            size: 40.0,
          )),
          ListTile(
            title: Text("H O M E"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("S E T T I N G S"),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 380.0),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }
}
