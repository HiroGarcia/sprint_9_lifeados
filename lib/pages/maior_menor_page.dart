import 'package:flutter/material.dart';

import '../utilidades/dialog_box.dart';

class MaiorMenor extends StatefulWidget {
  const MaiorMenor({super.key});

  @override
  State<MaiorMenor> createState() => _MaiorMenorState();
}

class _MaiorMenorState extends State<MaiorMenor> {
  String resultado1 = '';
  String resultado2 = '';
  double maior = 0;
  double menor = 0;
  var _controler1 = '';
  var _controler2 = '';
  var _controler3 = '';

  calculator() {
    if (double.tryParse(_controler1) == null ||
        double.tryParse(_controler2) == null ||
        double.tryParse(_controler3) == null) {
      resultado1 = 'Dados inseridos invalidos';
    } else {
      if ((double.tryParse(_controler1)! == double.tryParse(_controler2)!) &&
          (double.tryParse(_controler1)! == double.tryParse(_controler3)!)) {
        resultado1 = 'Todos os numeros são iguais';
        resultado2 = 'Todos os numeros são iguais';
      } else {
        double maior = double.tryParse(_controler1)!;
        double menor = double.tryParse(_controler1)!;
        if (double.tryParse(_controler2)! > maior) {
          maior = double.tryParse(_controler2)!;
        }
        if (double.tryParse(_controler3)! > maior) {
          maior = double.tryParse(_controler3)!;
        }
        if (double.tryParse(_controler2)! < menor) {
          menor = double.tryParse(_controler2)!;
        }
        if (double.tryParse(_controler3)! < menor) {
          menor = double.tryParse(_controler3)!;
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
            const Text('Maior e Menor '),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                _controler1 = value;
                // ignore: avoid_print
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'Primerio Valor',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                floatingLabelStyle: TextStyle(color: Colors.blue.shade900),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade900, width: 1.4),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                onChanged: (value) {
                  _controler2 = value;
                  // ignore: avoid_print
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'Segundo Valor',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.blue.shade900,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 1.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                _controler3 = value;
                // ignore: avoid_print
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'Terceiro Valor',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.blue.shade900,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade900, width: 1.4),
                  borderRadius: BorderRadius.circular(15),
                ),
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
