import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kleberandrade/helpers/url_helper.dart';
import 'package:kleberandrade/pages/home/contact/contact_dialog.dart';

import 'cover_button.dart';

class CoverButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
      child: Container(
        width: 720,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CoverButton(
              icon: Icons.mail,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return ContactDialog();
                  },
                );
              },
            ),
            CoverButton(
              icon: FontAwesomeIcons.researchgate,
              onPressed: () {
                UrlHelper.open(
                    'https://www.researchgate.net/profile/Kleber_Andrade2');
              },
            ),
            CoverButton(
              icon: FontAwesomeIcons.twitter,
              onPressed: () {
                UrlHelper.open('https://twitter.com/pdjkleber');
              },
            ),
            CoverButton(
              icon: FontAwesomeIcons.linkedin,
              onPressed: () {
                UrlHelper.open('https://www.linkedin.com/in/kleberandrade/');
              },
            ),
            CoverButton(
              icon: FontAwesomeIcons.medium,
              onPressed: () {
                UrlHelper.open('https://medium.com/@kleberandrade');
              },
            ),
            CoverButton(
              icon: FontAwesomeIcons.youtube,
              onPressed: () {
                UrlHelper.open('https://www.youtube.com/user/pdjkleber');
              },
            ),
            CoverButton(
              icon: FontAwesomeIcons.github,
              onPressed: () {
                UrlHelper.open('https://github.com/kleberandrade');
              },
            ),
            CoverButton(
              icon: FontAwesomeIcons.itchIo,
              onPressed: () {
                UrlHelper.open('https://kleberandrade.itch.io');
              },
            ),
          ],
        ),
      ),
    );
  }
}
