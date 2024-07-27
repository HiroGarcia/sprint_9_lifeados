import 'dart:math';

import 'package:flutter/material.dart';

import '../utilidades/dialog_box.dart';

class JogarDado extends StatefulWidget {
  const JogarDado({super.key});

  @override
  State<JogarDado> createState() => _JogarDadoState();
}

class _JogarDadoState extends State<JogarDado> {
  int lancarDado() {
    var random = Random();
    // Gera um número aleatório entre 1 e 6
    return random.nextInt(6) + 1;
  }

  int resultado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const DialogBox();
                    },
                  );
                });
              },
              child: const Text(
                'Opções ',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            const Text('Dado '),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clique no botão para lançar o dado',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultado = lancarDado();
                  });
                },
                child: const Text(
                  '=',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Resultado: $resultado',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
