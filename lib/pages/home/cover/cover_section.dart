import 'package:flutter/material.dart';
import 'package:kleberandrade/controllers/home_controller.dart';
import 'cover_button_list.dart';

class CoverSection extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _controller.coverSectionKey,
      width: 900.0,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 20.0,
            ),
            child: Text(
              'Kleber Andrade',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2.0,
            ),
            child: Divider(
              height: 0.2,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 20.0,
            ),
            child: Text(
              'Pesquisador, professor e programador nas horas livres',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          CoverButtonList(),
        ],
      ),
    );
  }
}
