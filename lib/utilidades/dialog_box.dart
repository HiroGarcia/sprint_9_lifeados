import 'package:flutter/material.dart';
import 'package:sprint_9/utilidades/button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 260,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyButton(
                opcao: 'Matematica Basica',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'operacoes');
                },
              ),
              MyButton(
                opcao: 'Media',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'media');
                },
              ),
              MyButton(
                opcao: 'Impar ou Par',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'imparpar');
                },
              ),
              MyButton(
                opcao: 'Bissexto',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'bissexto');
                },
              ),
              MyButton(
                opcao: 'Idade',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'idade');
                },
              ),
              MyButton(
                opcao: 'Fatorial',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'fatorial');
                },
              ),
              MyButton(
                opcao: 'Numero Primo',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'primo');
                },
              ),
              MyButton(
                opcao: 'Temperatura',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'temperatura');
                },
              ),
              MyButton(
                opcao: 'Calculo IMC',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'imc');
                },
              ),
              MyButton(
                opcao: 'Maior e Menor',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'maiormenor');
                },
              ),
              MyButton(
                opcao: 'Jogar Dado',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'dado');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
