import 'package:flutter/material.dart';

import '../utilidades/dialog_box.dart';

class VerificaIdade extends StatefulWidget {
  const VerificaIdade({super.key});

  @override
  State<VerificaIdade> createState() => _VerificaIdadeState();
}

class _VerificaIdadeState extends State<VerificaIdade> {
  String resultado = '';
  var _controler1 = '';

  calculator() {
    // ignore: unnecessary_null_comparison
    if (double.tryParse(_controler1) == null) {
      resultado = 'Dados inseridos invalidos';
    } else {
      if (double.tryParse(_controler1)! < 0) {
        resultado =
            'Idade inserida Invalida, digite um numero igual ou maior que 0';
      } else if (double.tryParse(_controler1)! <= 12) {
        resultado = 'A pessoa é Criança';
      } else if (double.tryParse(_controler1)! <= 17) {
        resultado = 'A pessoa é Adolescente';
      } else if (double.tryParse(_controler1)! <= 59) {
        resultado = 'A pessoa é Adulto';
      } else if (double.tryParse(_controler1)! >= 60) {
        resultado = 'A pessoa é Idoso';
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
            const Text('Idade '),
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
                labelText: 'Idade',
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
