import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Tempo Local - versão 2.1.0",
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
