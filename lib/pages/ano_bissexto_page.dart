import 'package:flutter/material.dart';

import '../utilidades/dialog_box.dart';

class AnoBissexto extends StatefulWidget {
  const AnoBissexto({super.key});

  @override
  State<AnoBissexto> createState() => _AnoBissextoState();
}

class _AnoBissextoState extends State<AnoBissexto> {
  String resultado = '';
  var _controler1 = '';

  calculator() {
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1) == null) {
      resultado = 'Dados inseridos invalidos';
    } else {
      if (double.tryParse(_controler1)! < 1882) {
        if (double.tryParse(_controler1)! % 4 == 0) {
          resultado = 'É Bissexto';
        } else {
          resultado = 'Não é Bissexto';
        }
      } else {
        if ((double.tryParse(_controler1)! % 4 == 0 &&
                double.tryParse(_controler1)! % 100 != 0) ||
            double.tryParse(_controler1)! % 400 == 0) {
          resultado = 'É Bissexto';
        } else {
          resultado = 'Não é Bissexto';
        }
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
            const Text('Ano Bissexto '),
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
                labelText: 'Ano',
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
