import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CityTemperature extends StatelessWidget {
  final String summary;
  final String cityName;
  final double temperature;

  CityTemperature(
      {@required this.summary,
      @required this.cityName,
      @required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) => Text(
                cityName,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Observer(
          builder: (_) => Text(
            summary,
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
        ),
        Observer(
          builder: (_) => Text(
            temperature.toStringAsFixed(0) + "°",
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
