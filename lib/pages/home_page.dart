import 'package:flutter/material.dart';
import 'package:kleberandrade/controllers/home_controller.dart';
import 'home/about/about_section.dart';
import 'home/course/course_section.dart';
import 'home/cover/cover_section.dart';
import 'home/footer/footer.dart';
import 'home/navbar/navbar.dart';
import 'home/project/project_section.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final controller = HomeController();

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          ListView(
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
          NavBar(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
