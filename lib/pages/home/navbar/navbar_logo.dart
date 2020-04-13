import 'package:flutter/material.dart';
import 'package:kleberandrade/controllers/home_controller.dart';

class NavbarLogo extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.jumpToHome();
      },
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 32,
            width: 32,
            child: Center(child: Image.asset('assets/images/logo.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Kleber Andrade',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
