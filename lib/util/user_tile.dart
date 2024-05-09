import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool isDarkMode;

  const UserTile({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = isDarkMode ? Colors.white : Colors.black87;
    Color iconColor = isDarkMode ? Colors.white : Colors.indigo;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.person, color: iconColor),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
