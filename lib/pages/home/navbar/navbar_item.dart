import 'package:flutter/material.dart';

class NavbarItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavbarItem({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: FlatButton(
        child: Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 14),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
