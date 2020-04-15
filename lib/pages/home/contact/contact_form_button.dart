import 'package:flutter/material.dart';

class ContactFormButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool loading;

  const ContactFormButton({
    Key key,
    this.text,
    this.onPressed,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        height: 50.0,
        width: 140.0,
        child: Center(
          child: loading
              ? Container(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                )
              : Text(
                  text.toUpperCase(),
                ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
