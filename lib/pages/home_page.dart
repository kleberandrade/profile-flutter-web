import 'package:flutter/material.dart';
import 'package:kleberandrade/controllers/home_controller.dart';
import 'package:kleberandrade/helpers/url_helper.dart';
import 'package:kleberandrade/pages/home/navbar/navbar_logo.dart';
import 'home/about/about_section.dart';
import 'home/course/course_section.dart';
import 'home/cover/cover_section.dart';
import 'home/footer/footer.dart';
import 'home/navbar/navbar_item.dart';
import 'home/project/project_section.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final controller = HomeController();

  final _mobileWidth = 750.0;
  double _width;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);

    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Theme.of(context).primaryColor,
      endDrawer: _buildNavbarDrawer(),
      body: ListView(
        controller: controller.scrollController,
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        children: <Widget>[
          CoverSection(),
          AboutSection(),
          CourseSection(),
          ProjectSection(),
          Footer(),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      title: NavbarLogo(),
      actions: _buildNavbarItems(),
    );
  }

  _getItems(bool usePop) {
    return [
      new NavbarItem(
        title: 'Autor',
        onPressed: () {
          controller.jumpToAbout();
          if (usePop) Navigator.of(context).pop();
        },
      ),
      new NavbarItem(
        title: 'Cursos',
        onPressed: () {
          controller.jumpToCourse();
          if (usePop) Navigator.of(context).pop();
        },
      ),
      new NavbarItem(
        title: 'Projetos',
        onPressed: () {
          controller.jumpToProject();
          if (usePop) Navigator.of(context).pop();
        },
      ),
      new NavbarItem(
        title: 'Currículo',
        onPressed: () =>
            UrlHelper.open('http://lattes.cnpq.br/1498251399219988'),
      ),
    ];
  }

  _buildNavbarDrawer() {
    if (_width >= _mobileWidth) return null;

    return Drawer(
      child: ListView(
        children: _getItems(true),
      ),
    );
  }

  _buildNavbarItems() {
    if (_width < _mobileWidth) return null;

    return _getItems(false);
  }

  @override
  bool get wantKeepAlive => true;
}
