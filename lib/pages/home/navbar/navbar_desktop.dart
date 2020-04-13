import 'package:flutter/material.dart';
import 'navbar_logo.dart';

class NavbarDesktop extends StatelessWidget {
  final List<Widget> navbarItems;
  const NavbarDesktop({
    Key key,
    this.navbarItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      height: 80.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NavbarLogo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navbarItems,
          ),
        ],
      ),
    );
  }
}
