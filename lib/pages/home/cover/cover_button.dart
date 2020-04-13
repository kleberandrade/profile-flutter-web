import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoverButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  CoverButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.white54,
      iconSize: 32,
      onPressed: onPressed,
    );
  }
}
