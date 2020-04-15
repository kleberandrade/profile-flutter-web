import 'package:flutter/material.dart';

import 'package:kleberandrade/components/centered_message.dart';
import 'package:kleberandrade/components/centered_progress.dart';
import 'package:kleberandrade/controllers/home_controller.dart';
import 'package:kleberandrade/models/course.dart';
import 'package:kleberandrade/pages/home/sections/section_description.dart';
import 'package:kleberandrade/pages/home/sections/section_filter_list.dart';
import 'package:kleberandrade/pages/home/sections/section_title.dart';
import 'package:kleberandrade/services/course_api.dart';

import 'course_card.dart';

class CourseSection extends StatefulWidget {
  @override
  _CourseSectionState createState() => _CourseSectionState();
}

class _CourseSectionState extends State<CourseSection>
    with AutomaticKeepAliveClientMixin {
  final _controller = HomeController();

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      key: _controller.courseSectionKey,
      color: Color(0xFFF8F9FA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SectionTitle(
            text: 'Cursos',
          ),
          SectionDescription(
            description:
                'Espaço destinado aos materiais dos cursos criados e ministrados por mim.',
          ),
          SectionFilterList(
            filterList: _controller.courseFilterItems,
            onSaved: (index) {
              setState(() {
                _controller.courseFilterSelected = index;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 32.0),
            child: Container(
              width: 1080,
              height: 460.0,
              child: _buildList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildList() {
    return FutureBuilder<List<Course>>(
      future: CourseApi.fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Course> data = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext ctxt, int index) {
              final course = data[index];
              if (_controller.courseFilterItemSelected == _controller.courseFilterItems[0] ||
                  course.tag == _controller.courseFilterItemSelected)
                return CourseCard(
                  course: course,
                );

              return SizedBox();
            },
          );
        } else if (snapshot.hasError) {
          return CenteredMessage(snapshot.error);
        }
        return CenteredProgress();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
