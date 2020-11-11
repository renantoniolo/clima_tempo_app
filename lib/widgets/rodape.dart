import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Tempo Local - versão 2.1.0",
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
