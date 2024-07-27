import 'package:flutter/material.dart';

import '../utilidades/dialog_box.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  String resultado = '';
  var _controler1 = '';
  var _controler2 = '';
  double aux = 0;
  int aux1 = 0;
  calculator() {
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1) == null ||
        double.tryParse(_controler2) == null) {
      resultado = 'Dados inseridos invalidos';
    } else {
      aux = double.tryParse(_controler1)! /
          (double.tryParse(_controler2)! * double.tryParse(_controler2)!);
      // esta multiplicando para andar 2 casas decimais, depois arredondo e volta a ser decimal
      // assim volta a ser um double porem não fica mais de 2 numeros depois da virgura
      aux *= 100;
      //.round arredonda um numero double para um inteiro a depender se o quebrado passa de .50 ou não
      aux1 = aux.round();
      aux = aux1 / 100;
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
            const Text('Imc '),
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
                labelText: 'Peso',
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
                  labelText: 'Altura',
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
              'Resultado: $resultado',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
