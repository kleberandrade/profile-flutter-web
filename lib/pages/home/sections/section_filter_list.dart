import 'package:flutter/material.dart';
import 'package:kleberandrade/components/filter_button.dart';

class SectionFilterList extends StatelessWidget {
  final List<String> filterList;
  final Function(int) onSaved;

  const SectionFilterList({
    Key key,
    this.filterList,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Container(
        width: 1080.0,
        child: FilterButton(
          borderRadius: 0.0,
          initialValue: 0,
          space: 4.0,
          items: filterList,
          onSaved: onSaved,
        ),
      ),
    );
  }
}
