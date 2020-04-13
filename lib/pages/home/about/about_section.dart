import 'package:flutter/material.dart';

import 'package:kleberandrade/controllers/home_controller.dart';
import 'package:kleberandrade/pages/home/sections/section_description.dart';
import 'package:kleberandrade/pages/home/sections/section_title.dart';

class AboutSection extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _controller.aboutSectionKey,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SectionTitle(
            text: 'Sobre o autor',
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 52.0, 20.0, 20.0),
            child: SizedBox(
              height: 120,
              width: 120,
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          ),
          SectionDescription(
            description:
                'Possui graduação em Ciência da Computação pela Escola de Engenharia de Piracicaba (2008), mestrado e doutorado em Engenharia Mecânica pela Universidade de São Paulo (2011/2016). Especialização em Game Design pela Universidade Positivo (2018). Atualmente é professor assistente na Faculdade de Tecnologia Americana e professor no Centro Universitário Salesiano São Paulo campus São José - Campinas. Tem experiência na área de Ciência da Computação, com ênfase em Inteligência Artificial, atuando principalmente nos seguintes temas: Computação Evolutiva, Redes Neurais, Serious Games, Reabilitação Robótica e Robótica Móvel.',
          ),
        ],
      ),
    );
  }
}
