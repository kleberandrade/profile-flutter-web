import 'package:flutter/material.dart';
import 'package:kleberandrade/components/centered_message.dart';
import 'package:kleberandrade/components/centered_progress.dart';
import 'package:kleberandrade/controllers/home_controller.dart';
import 'package:kleberandrade/models/project.dart';
import 'package:kleberandrade/pages/home/project/project_card.dart';
import 'package:kleberandrade/pages/home/sections/section_description.dart';
import 'package:kleberandrade/pages/home/sections/section_filter_list.dart';
import 'package:kleberandrade/pages/home/sections/section_title.dart';
import 'package:kleberandrade/services/project_api.dart';

class ProjectSection extends StatefulWidget {
  @override
  _ProjectSectionState createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection>
    with AutomaticKeepAliveClientMixin {
  final _controller = HomeController();

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      key: _controller.projectSectionKey,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SectionTitle(
            text: 'Projetos',
          ),
          SectionDescription(
            description:
                'Espaço destinado aos projetos desenvolvidos, tais como: aplicativos, jogos, robôs e sistemas',
          ),
          SectionFilterList(
            filterList: _controller.projectFilterItems,
            onSaved: (index) {
              setState(() {
                _controller.projectFilterSelected = index;
                print(
                    'Project selected: ${_controller.projectFilterItemSelected}');
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
    return FutureBuilder<List<Project>>(
      future: ProjectApi.fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Project> data = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext ctxt, int index) {
              final project = data[index];

              if (_controller.projectFilterItemSelected ==
                      _controller.projectFilterItems[0] ||
                  project.tag.contains(_controller.projectFilterItemSelected))
                return ProjectCard(
                  project: project,
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
