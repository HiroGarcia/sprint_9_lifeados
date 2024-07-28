import 'package:flutter/material.dart';
import 'package:sprint_9/utilidades/field_box.dart';

import '../utilidades/dialog_box.dart';

class ImparOuPar extends StatefulWidget {
  const ImparOuPar({super.key});

  @override
  State<ImparOuPar> createState() => _ImparOuParState();
}

class _ImparOuParState extends State<ImparOuPar> {
  final TextEditingController _controler1 = TextEditingController();
  String resultado = '';

  calculator() {
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1.text) == null) {
      resultado = 'Dados inseridos invalidos';
    } else {
      if (double.tryParse(_controler1.text)! % 2 == 0) {
        resultado = 'Par';
      } else {
        resultado = 'Impar';
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
            const Text('Impar ou Par '),
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
