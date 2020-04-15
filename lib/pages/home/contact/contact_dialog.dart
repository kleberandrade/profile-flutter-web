import 'package:flutter/material.dart';
import 'package:kleberandrade/controllers/contact_controller.dart';
import 'package:kleberandrade/models/contact.dart';
import 'package:kleberandrade/pages/home/contact/contact_form_button.dart';
import 'package:kleberandrade/pages/home/contact/contact_text_field.dart';
import 'package:kleberandrade/pages/home/sections/section_description.dart';
import 'package:kleberandrade/pages/home/sections/section_title.dart';

class ContactDialog extends StatefulWidget {
  @override
  _ContactDialogState createState() => _ContactDialogState();
}

class _ContactDialogState extends State<ContactDialog> {
  final _formKey = GlobalKey<FormState>();
  final _controller = ContactController();
  final _contact = Contact();

  bool sending = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: SectionTitle(
        text: 'Contato',
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SectionDescription(
              description: 'Você tem alguma pergunta?',
              vertical: 16.0,
            ),
            ContactTextField(
              hintText: 'Nome',
              icon: Icons.person,
              onSaved: (text) => _contact.name = text,
              enabled: !sending,
              keyboardType: TextInputType.text,
            ),
            ContactTextField(
              hintText: 'Email',
              icon: Icons.email,
              onSaved: (text) => _contact.email = text,
              enabled: !sending,
              keyboardType: TextInputType.emailAddress,
            ),
            ContactTextField(
              hintText: 'Mensagem',
              maxLines: 5,
              icon: Icons.message,
              onSaved: (text) => _contact.message = text,
              enabled: !sending,
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.all(16.0),
      actions: <Widget>[
        ContactFormButton(
          text: 'Cancelar',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ContactFormButton(
          text: 'Enviar',
          loading: sending,
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              setState(() {
                sending = true;
              });

              final result = await _controller.sendEmail(_contact);

              if (result) {
                Navigator.of(context).pop();
                _controller.showSuccessDialog(context);
              } else {
                setState(() {
                  sending = false;
                });

                _controller.showFailureDialog(context);
              }
            }
          },
        ),
      ],
    );
  }
}
