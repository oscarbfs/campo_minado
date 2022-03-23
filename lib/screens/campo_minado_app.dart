import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/models/campo.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({ Key? key }) : super(key: key);

  void _reiniciar() {
    print('reiniciar');
  }

  void _abrir(Campo campo) {
    print('abrir');
  }

  void _alternarMarcacao(Campo campo) {
    print('alterar');

  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 0);
    vizinho1.minar();   

    Campo vizinho2 = Campo(linha: 1, coluna: 1);
    vizinho2.minar();   

    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(vizinho1);
    campo.adicionarVizinho(vizinho2);

    try {
      // campo.minar();
      campo.alternarMarcacao ();
    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}