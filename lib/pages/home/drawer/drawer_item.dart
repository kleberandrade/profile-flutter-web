import 'package:flutter/material.dart';
import 'package:kleberandrade/pages/home/navbar/navbar_item.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final NavbarItem item;
  const DrawerItem(this.item, {this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 30),
          item,
        ],
      ),
    );
  }
}
