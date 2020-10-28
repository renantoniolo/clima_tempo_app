import 'package:clima_tempo_app/models/weather.dart';
import 'package:flutter/material.dart';

class DayRow extends StatelessWidget {
  final WeatherDay day;

  DayRow({@required this.day});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 30;
    var widthValue = (screenWidth - 140) / 3;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            height: 30,
            width: 140,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              day.day,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 30,
            width: widthValue,
            alignment: Alignment.center,
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
            width: widthValue,
            alignment: Alignment.centerRight,
            child: Text(
              day.temperatureMax,
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 30,
            width: widthValue,
            alignment: Alignment.centerRight,
            child: Text(
              day.temperatureMin,
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
