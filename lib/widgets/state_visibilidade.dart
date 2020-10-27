import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StateVisibility extends StatelessWidget {

  final double visibility;
  final int ozonio;

  StateVisibility({@required this.visibility, @required this.ozonio});

  @override
  Widget build(BuildContext context) {
     var screenWidth = MediaQuery.of(context).size.width - 30;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenWidth / 2,
              child: Text(
                "Visibilidade",
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: screenWidth / 2,
              child: Text(
                "Índice UV",
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenWidth / 2,
              child: Observer(
                builder: (_) => Text(
                  visibility.toStringAsFixed(1) + " km/h",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              width: screenWidth / 2,
              child: Observer(
                builder: (_) => Text(
                  ozonio.toString(),
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}