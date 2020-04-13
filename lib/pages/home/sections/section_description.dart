import 'package:flutter/material.dart';

class SectionDescription extends StatelessWidget {
  final String description;

  SectionDescription({this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            height: 1.5,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
