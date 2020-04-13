import 'package:flutter/material.dart';
import 'package:kleberandrade/controllers/home_controller.dart';
import 'package:kleberandrade/helpers/url_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navbar_desktop.dart';
import 'navbar_item.dart';
import 'navbar_mobile.dart';

class NavBar extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavbarMobile(navbarItems: _getItems()),
      tablet: NavbarDesktop(navbarItems: _getItems()),
    );
  }

  List<Widget> _getItems() {
    return [
      new NavbarItem(
        title: 'Autor',
        onPressed: () {
          _controller.jumpToAbout();
        },
      ),
      new NavbarItem(
        title: 'Cursos',
        onPressed: () {
          _controller.jumpToCourse();
        },
      ),
      new NavbarItem(
        title: 'Projetos',
        onPressed: () {
          _controller.jumpToProject();
        },
      ),
      new NavbarItem(
        title: 'Currículo',
        onPressed: () =>
            UrlHelper.open('http://lattes.cnpq.br/1498251399219988'),
      ),
    ];
  }
}
