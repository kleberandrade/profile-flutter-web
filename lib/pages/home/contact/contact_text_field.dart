import 'package:flutter/material.dart';

class ContactTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final IconData icon;
  final Function(String) onSaved;
  final TextInputType keyboardType;
  final bool enabled;

  const ContactTextField({
    Key key,
    this.hintText,
    this.maxLines = 1,
    this.icon,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        enabled: enabled,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        decoration: new InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        validator: (text) {
          if (text.isEmpty) return 'Campo obrigatório';
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
