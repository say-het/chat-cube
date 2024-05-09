import 'package:flutter/material.dart';

class MyBtn extends StatefulWidget {
  final String text;
  final Function()? onTap;

  const MyBtn({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  _MyBtnState createState() => _MyBtnState();
}

class _MyBtnState extends State<MyBtn> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.95).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.blueAccent,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
