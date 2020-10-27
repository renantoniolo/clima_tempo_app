import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Tempo Local - 2020",
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
