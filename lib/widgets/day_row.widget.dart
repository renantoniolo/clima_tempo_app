import 'package:clima_tempo_app/models/weather.dart';
import 'package:flutter/material.dart';

class DayRow extends StatelessWidget {
  final WeatherDay day;

  DayRow({@required this.day});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 30;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
            width: screenWidth / 2,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              day.day,
              style: Theme.of(context).textTheme.display3,
            ),
          ),
          Container(
            height: 30,
            width: screenWidth / 5,
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.cloud,
              color: Colors.white,
              size: 20.0,
              textDirection: TextDirection.rtl,
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 30,
            width: 50,
            alignment: Alignment.center,
            child: Text(
              day.temperatureMax.toStringAsFixed(0) + "°",
              style: Theme.of(context).textTheme.display3,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 30,
            width: 50,
            alignment: Alignment.center,
            child: Text(
              day.temperatureMin.toStringAsFixed(0) + "°",
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
