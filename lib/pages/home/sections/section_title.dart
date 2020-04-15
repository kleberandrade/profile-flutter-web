import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final double width;
  final String text;

  SectionTitle({this.text, this.width = 400.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 32.0, 20.0, 20.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 42.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            width: 600.0,
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
            child: Center(
              child: Divider(
                color: Theme.of(context).primaryColor,
                height: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
