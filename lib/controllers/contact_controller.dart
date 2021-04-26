import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kleberandrade/models/contact.dart';
import 'package:kleberandrade/services/contact_api.dart';

class ContactController {
  Future<bool> sendEmail(Contact contact) async {
    final response = await ContactApi.fetch(contact);
    if (response == null) return false;

    return json.decode(response.body)['status'] == 'SUCCESS';
  }

  void showSuccessDialog(BuildContext context) {
    _showDialog(
      context: context,
      title: "Sucesso",
      message: "Email enviado com sucesso!",
      color: Colors.green,
    );
  }

  void showFailureDialog(BuildContext context) {
    _showDialog(
      context: context,
      title: "Erro",
      message: "Falha ao tentar enviar o email",
      color: Colors.red,
    );
  }

  void _showDialog(
      {BuildContext context, String title, String message, Color color}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
      maxWidth: 500.0,
      title: title,
      message: message,
      backgroundColor: color.withOpacity(0.5),
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
