import 'package:flutter/material.dart';
import 'package:sprint_9/utilidades/field_box.dart';

import '../utilidades/dialog_box.dart';

class OperacaoesPage extends StatefulWidget {
  const OperacaoesPage({super.key});

  @override
  State<OperacaoesPage> createState() => _OperacaoesPageState();
}

class _OperacaoesPageState extends State<OperacaoesPage> {
  final TextEditingController _controler1 = TextEditingController();
  final TextEditingController _controler2 = TextEditingController();

  String resultado = '';

  calculator(String operation) {
    double? aux;
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1.text) == null ||
        double.tryParse(_controler2.text) == null) {
      resultado = 'Dados inseridos invalidos';
    } else {
      aux = double.tryParse(_controler1.text)! +
          double.tryParse(_controler2.text)!;
      resultado = aux.toString();

      switch (operation) {
        case 'add':
          aux = double.tryParse(_controler1.text)! +
              double.tryParse(_controler2.text)!;
          resultado = aux.toString();
          break;
        case 'subtract':
          aux = double.tryParse(_controler1.text)! -
              double.tryParse(_controler2.text)!;
          resultado = aux.toString();
          break;
        case 'multiply':
          aux = double.tryParse(_controler1.text)! *
              double.tryParse(_controler2.text)!;
          resultado = aux.toString();
          break;
        case 'divide':
          if (double.tryParse(_controler1.text) == 0 ||
              double.tryParse(_controler2.text) == 0) {
            resultado = 'Erro, divisão por 0';
          } else {
            aux = double.tryParse(_controler1.text)! /
                double.tryParse(_controler2.text)!;
            resultado = aux.toString();
          }

          break;
        default:
          break;
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
            const Text('Matematica Simples '),
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
              texto: 'Primero Valor',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 25),
              child: MyFieldBox(
                controler: _controler2,
                texto: 'Segundo Valor',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator('add');
                    });
                  },
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator('subtract');
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator('multiply');
                    });
                  },
                  child: const Icon(Icons.close),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculator('divide');
                    });
                  },
                  child: Transform.rotate(
                    angle: -45,
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                )
              ],
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
