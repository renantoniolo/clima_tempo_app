import 'package:clima_tempo_app/models/weather.dart';
import 'package:flutter/material.dart';
import 'day_row.dart';

class ListDay extends StatelessWidget {
  final List<WeatherDay> listDay;

  ListDay({@required this.listDay});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listDay.length,
        itemBuilder: (BuildContext context, int i) {
          return DayRow(day: listDay[i]);
        });
  }
}
