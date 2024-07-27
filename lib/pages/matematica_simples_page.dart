import 'package:flutter/material.dart';

import '../utilidades/dialog_box.dart';

class OperacaoesPage extends StatefulWidget {
  const OperacaoesPage({super.key});

  @override
  State<OperacaoesPage> createState() => _OperacaoesPageState();
}

class _OperacaoesPageState extends State<OperacaoesPage> {
  String resultado = 'Teste';
  var _controler1 = '';
  var _controler2 = '';
  double? aux;

  calculator(String operation) {
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1) == null ||
        double.tryParse(_controler2) == null) {
      resultado = 'Erro';
    } else {
      aux = double.tryParse(_controler1)! + double.tryParse(_controler2)!;
      resultado = aux.toString();

      switch (operation) {
        case 'add':
          aux = double.tryParse(_controler1)! + double.tryParse(_controler2)!;
          resultado = aux.toString();
          break;
        case 'subtract':
          aux = double.tryParse(_controler1)! - double.tryParse(_controler2)!;
          resultado = aux.toString();
          break;
        case 'multiply':
          aux = double.tryParse(_controler1)! * double.tryParse(_controler2)!;
          resultado = aux.toString();
          break;
        case 'divide':
          if (double.tryParse(_controler1) == 0 ||
              double.tryParse(_controler2) == 0) {
            resultado = 'Erro, divisão por 0';
          } else {
            aux = double.tryParse(_controler1)! / double.tryParse(_controler2)!;
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
              padding: const EdgeInsets.only(top: 15, bottom: 25),
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
