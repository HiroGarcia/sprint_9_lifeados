import 'package:flutter/material.dart';

import '../utilidades/dialog_box.dart';
import '../utilidades/field_box.dart';

class Media extends StatefulWidget {
  const Media({super.key});

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  final TextEditingController _controler1 = TextEditingController();
  final TextEditingController _controler2 = TextEditingController();
  final TextEditingController _controler3 = TextEditingController();
  String resultado = '';

  calculator() {
    double? aux;
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1.text) == null ||
        double.tryParse(_controler2.text) == null ||
        double.tryParse(_controler3.text) == null) {
      resultado = 'Dados inseridos invalidos';
    } else {
      aux = (double.tryParse(_controler1.text)! +
              double.tryParse(_controler2.text)! +
              double.tryParse(_controler3.text)!) /
          3;
      resultado = aux.toString();
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
            const Text('Média de 3 Números '),
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
