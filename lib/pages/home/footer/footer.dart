import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 20.0,
          ),
          child: Text(
            '© 2020 Copyright Kleber de Oliveira Andrade. Todos os direitos reservados.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
