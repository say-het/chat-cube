import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String reciverEmail;
   ChatPage({super.key, required this.reciverEmail});

  final TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reciverEmail),
        
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextField(
                controller: input,
              ),

        IconButton(onPressed: (){}, icon: Icon(Icons.send))
            ],
          )
        ],
      ),
    );
  }
}
