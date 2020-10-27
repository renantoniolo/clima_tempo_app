import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StateWind extends StatelessWidget {
  final double apparentTemperature;
  final double windSpeed;

  StateWind({@required this.apparentTemperature, @required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 30;

    return Column(
      children: <Widget>[
        Divider(
          color: Colors.white,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenWidth / 2,
              child: Text(
                "Vento",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: screenWidth / 2,
              child: Text(
                "Sensação Térmica",
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
                  windSpeed.toStringAsFixed(0) + " km/h",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              width: screenWidth / 2,
              child: Observer(
                builder: (_) => Text(
                  apparentTemperature.toStringAsFixed(0) + "°",
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
