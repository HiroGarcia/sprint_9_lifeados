import 'package:flutter/material.dart';
import 'package:sprint_9/utilidades/field_box.dart';

import '../utilidades/dialog_box.dart';

class MaiorMenor extends StatefulWidget {
  const MaiorMenor({super.key});

  @override
  State<MaiorMenor> createState() => _MaiorMenorState();
}

class _MaiorMenorState extends State<MaiorMenor> {
  final TextEditingController _controler1 = TextEditingController();
  final TextEditingController _controler2 = TextEditingController();
  final TextEditingController _controler3 = TextEditingController();
  String resultado1 = '';
  String resultado2 = '';

  calculator() {
    if (double.tryParse(_controler1.text) == null ||
        double.tryParse(_controler2.text) == null ||
        double.tryParse(_controler3.text) == null) {
      resultado1 = 'Dados inseridos invalidos';
      resultado2 = 'Dados inseridos invalidos';
    } else {
      if ((double.tryParse(_controler1.text)! ==
              double.tryParse(_controler2.text)!) &&
          (double.tryParse(_controler1.text)! ==
              double.tryParse(_controler3.text)!)) {
        resultado1 = 'Todos os numeros são iguais';
        resultado2 = 'Todos os numeros são iguais';
      } else {
        double maior = double.tryParse(_controler1.text)!;
        double menor = double.tryParse(_controler1.text)!;
        if (double.tryParse(_controler2.text)! > maior) {
          maior = double.tryParse(_controler2.text)!;
        }
        if (double.tryParse(_controler3.text)! > maior) {
          maior = double.tryParse(_controler3.text)!;
        }
        if (double.tryParse(_controler2.text)! < menor) {
          menor = double.tryParse(_controler2.text)!;
        }
        if (double.tryParse(_controler3.text)! < menor) {
          menor = double.tryParse(_controler3.text)!;
        }
        resultado1 = 'Maior $maior';
        resultado2 = 'Menor $menor';
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
            const Text('Maior e Menor de 3 Valores'),
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
              texto: 'Primeiro Valor',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: MyFieldBox(
                controler: _controler2,
                texto: 'Segundo Valor',
              ),
            ),
            MyFieldBox(
              controler: _controler3,
              texto: 'Terceiro Valor',
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
              height: 25,
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
