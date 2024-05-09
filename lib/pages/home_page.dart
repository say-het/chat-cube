import 'package:flutter/material.dart';
import 'package:login_logout_email/pages/chat_page.dart';
import 'package:login_logout_email/services/chat/chat_services.dart';
import 'package:login_logout_email/util/mydrawer.dart';
import 'package:login_logout_email/util/user_tile.dart';

class HomePage extends StatefulWidget {
  final String email;

  HomePage({Key? key, required this.email}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatServices _chatServices = ChatServices();
  bool isDarkMode = false; // Initial value for dark mode

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatServices.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Center(child: CircularProgressIndicator());

        }
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
            child: _buildUserListItem(userData, context),
          ))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
      isDarkMode: isDarkMode,
      text: userData["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              reciverEmail: userData["email"],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text(widget.email),
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
            drawer: MyDrawer(),
            body: _buildUserList(),
          ),
        );
      },
    );
  }
}
