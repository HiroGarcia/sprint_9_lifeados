import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyFieldBox extends StatelessWidget {
  final TextEditingController controler;
  final String texto;

  const MyFieldBox({
    super.key,
    required this.controler,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controler,
      onChanged: (value) {
        // ignore: avoid_print
        print(value);
      },
      decoration: InputDecoration(
        labelText: texto,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        floatingLabelStyle: TextStyle(color: Colors.blue.shade900),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade900, width: 1.4),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
