import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:kleberandrade/helpers/url_helper.dart';
import 'package:kleberandrade/pages/home/navbar/navbar_item.dart';

List<Widget> buildNavbarItems() {
  List<Widget> list = [
    new NavbarItem(
      title: 'Autor',
      onPressed: () {},
    ),
    new NavbarItem(
      title: 'Cursos',
      onPressed: () {},
    ),
    new NavbarItem(
      title: 'Projetos',
      onPressed: () {},
    ),
    new NavbarItem(
      title: 'Currículo',
      onPressed: () =>
          UrlHelper.open('http://lattes.cnpq.br/1498251399219988'),
    ),
  ];

  return list;
}
