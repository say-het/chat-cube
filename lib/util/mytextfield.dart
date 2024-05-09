import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hinttext;
  final bool pass;
  final TextEditingController controller;

  MyTextField({
    Key? key,
    required this.hinttext,
    required this.pass,
    required this.controller,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obs = true;
  bool isFocused = false;

  void seePass() {
    setState(() {
      obs = !obs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.pass && obs,
      autocorrect: false,
      controller: widget.controller,
      enableSuggestions: false,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        hintText: widget.hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: isFocused ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      onTap: () {
        setState(() {
          isFocused = true;
        });
      },
      onChanged: (value) {
        setState(() {
          isFocused = value.isNotEmpty;
        });
      },
      onSubmitted: (value) {
        setState(() {
          isFocused = false;
        });
      },
      // Reset isFocused when the TextField loses focus
      onEditingComplete: () {
        setState(() {
          isFocused = false;
        });
      },
    );
  }
}
