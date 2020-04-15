import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final FormFieldSetter<int> onSaved;
  final int initialValue;
  final double borderRadius;
  final List<String> items;
  final double space;

  FilterButton({
    this.onSaved,
    this.initialValue,
    this.borderRadius = 4.0,
    this.items,
    this.space = 10.0,
  });

  List<Widget> _buildRowList(
      {BuildContext context, FormFieldState<int> state}) {
    List<Widget> itemWidget = [];
    for (int i = 0; i < items.length; i++) {
      itemWidget.add(
        _buildCustomButton(
          context: context,
          state: state,
          option: i,
          label: items[i],
        ),
      );

      if (i != items.length - 1) {
        itemWidget.add(
          SizedBox(
            width: 10.0,
          ),
        );
      }
    }
    return itemWidget;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state) {
        return Row(
          children: _buildRowList(context: context, state: state),
        );
      },
    );
  }

  Widget _buildCustomButton(
      {FormFieldState<int> state,
      BuildContext context,
      int option,
      String label = ''}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print('Change state to $option');
          state.didChange(option);
          onSaved(option);
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: state.value != option
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
            color: state.value != option
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: state.value == option
                  ? Colors.white
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
