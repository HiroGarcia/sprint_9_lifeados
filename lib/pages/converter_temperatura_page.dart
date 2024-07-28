import 'package:flutter/material.dart';

import '../utilidades/dialog_box.dart';
import '../utilidades/field_box.dart';

class Temperatura extends StatefulWidget {
  const Temperatura({super.key});

  @override
  State<Temperatura> createState() => _TemperaturaState();
}

class _TemperaturaState extends State<Temperatura> {
  final TextEditingController _controler1 = TextEditingController();
  final TextEditingController _controler2 = TextEditingController();
  String resultado1 = '';
  String resultado2 = '';

  calculator() {
    double aux1 = 0;
    double aux2 = 0;
    int aux2v1 = 0;
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1.text) == null) {
      resultado1 = 'Dados inseridos invalidos';
    } else {
      aux1 = double.tryParse(_controler1.text)! * 1.8 + 32;
      resultado1 = '${_controler1.text} Graus em Fahrenheit é $aux1 Fahrenheit';
    }
    if (double.tryParse(_controler2.text) == null) {
      resultado2 = 'Dados inseridos invalidos';
    } else {
      aux2 = (double.tryParse(_controler2.text)! - 32) / 1.8;
      aux2 *= 100;
      aux2v1 = aux2.round();
      aux2 = aux2v1 / 100;
      resultado2 = '${_controler2.text} Fahrenheit em Graus é $aux2 Graus';
    }
  }

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
            const Text('Temperatura '),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyFieldBox(
              controler: _controler1,
              texto: 'Temperatura em Graus para Fahrenheit',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MyFieldBox(
                controler: _controler2,
                texto: 'Temperatura em Fahrenheit para Graus',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    calculator();
                  });
                },
                child: const Text(
                  '=',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Text(
              'Resultado: $resultado1',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Resultado: $resultado2',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
