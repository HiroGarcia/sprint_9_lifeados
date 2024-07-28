import 'package:flutter/material.dart';
import 'package:sprint_9/utilidades/field_box.dart';

import '../utilidades/dialog_box.dart';

class Fatorial extends StatefulWidget {
  const Fatorial({super.key});

  @override
  State<Fatorial> createState() => _FatorialState();
}

class _FatorialState extends State<Fatorial> {
  final TextEditingController _controler1 = TextEditingController();
  String resultado = '';

  calculator() {
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1.text) == null) {
      resultado = 'Dados inseridos invalidos';
    } else {
      int n = int.tryParse(_controler1.text)!;
      int aux = 1;

      if (n < 0) {
        resultado = 'Não existe Fatorial de Negativo';
      } else {
        for (int i = 1; i < n + 1; i++) {
          aux *= i;
        }
        resultado = aux.toString();
      }
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
            const Text('Fatorial '),
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
              texto: 'Número',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
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
