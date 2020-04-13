import 'package:flutter/cupertino.dart';

class HomeController {
  static final HomeController _singleton = new HomeController._internal();

  factory HomeController() {
    return _singleton;
  }

  HomeController._internal();

  final scrollController = ScrollController();
  final coverSectionKey = GlobalKey();
  final aboutSectionKey = GlobalKey();
  final courseSectionKey = GlobalKey();
  final projectSectionKey = GlobalKey();

  final _navbarHeight = 80.0;
  double _coverHeight;
  double _aboutHeight;
  double _courseHeight;
  double _projectHeight;

  void _jumpTo(double offset, {int milliseconds = 300}) {
    scrollController.animateTo(
      offset,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: milliseconds),
    );
  }

  void jumpToHome() {
    _updateSizes();
    _jumpTo(0.0);
  }

  void jumpToAbout() {
    _updateSizes();
    _jumpTo(_coverHeight - _navbarHeight);
  }

  void jumpToCourse() {
    _updateSizes();
    _jumpTo(_coverHeight + _aboutHeight - _navbarHeight);
  }

  void jumpToProject() {
    _updateSizes();
    if (_courseHeight == null)
      _jumpTo(scrollController.position.maxScrollExtent);
    else
      _jumpTo(_coverHeight + _aboutHeight + _courseHeight - _navbarHeight);
  }

  void _updateSizes() {
    _coverHeight =
        _coverHeight ?? coverSectionKey?.currentContext?.size?.height;
    _aboutHeight =
        _aboutHeight ?? aboutSectionKey?.currentContext?.size?.height;
    _courseHeight =
        _courseHeight ?? courseSectionKey?.currentContext?.size?.height;
    _projectHeight =
        _projectHeight ?? projectSectionKey?.currentContext?.size?.height;
  }
}
