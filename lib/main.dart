import 'package:flutter/material.dart';
import 'package:sprint_9/pages/impar_par_page.dart';
import 'package:sprint_9/pages/jogar_dado_page.dart';
import 'package:sprint_9/pages/maior_menor_page.dart';
import 'package:sprint_9/pages/media_page.dart';
import 'pages/ano_bissexto_page.dart';
import 'pages/converter_temperatura_page.dart';
import 'pages/fatorial_page.dart';
import 'pages/imc_page.dart';
import 'pages/matematica_simples_page.dart';
import 'pages/primo_page.dart';
import 'pages/verifica_idade_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'operacoes',
    routes: {
      'operacoes': (context) => const OperacaoesPage(),
      'media': (context) => const Media(),
      'imparpar': (context) => const ImparOuPar(),
      'bissexto': (context) => const AnoBissexto(),
      'idade': (context) => const VerificaIdade(),
      'fatorial': (context) => const Fatorial(),
      'primo': (context) => const TestePrimo(),
      'temperatura': (context) => const Temperatura(),
      'imc': (context) => const ImcPage(),
      'maiormenor': (context) => const MaiorMenor(),
      'dado': (context) => const JogarDado(),
    },
  ));
}
