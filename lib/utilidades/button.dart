import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String opcao;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.opcao,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              minimumSize: const Size(230, 18)),
          child: Text(
            opcao,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        const Divider(
          color: Colors.black38,
        ),
      ],
    );
  }
}
