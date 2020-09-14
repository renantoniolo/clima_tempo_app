import 'package:clima_tempo_app/controller/geolocation_controller.dart';
import 'package:clima_tempo_app/widgets/city_temperature.widget.dart';
import 'package:clima_tempo_app/widgets/day_now.widget.dart';
import 'package:clima_tempo_app/widgets/image_background.widget.dart';
import 'package:clima_tempo_app/widgets/list_day.widget.dart';
import 'package:clima_tempo_app/widgets/load_state.widget.dart';
import 'package:clima_tempo_app/widgets/rodape.widget.dart';
import 'package:clima_tempo_app/widgets/state_visibilidade.widget.dart';
import 'package:clima_tempo_app/widgets/state_wind.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final locationController = GeolocationController();

  @override
  void initState() {
    super.initState();
    locationController.getGeoLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          ImageBackground(),
          Column(
            children: <Widget>[
              Observer(
                builder: (_) => locationController.isLoad
                    ? LoadState(isVisible: true)
                    : CityTemperature(
                        summary: locationController.weather.summary,
                        cityName: locationController.cityName,
                        temperature: locationController.weather.temperature,
                      ),
              ),
              Observer(
                builder: (_) =>
                    locationController.isLoad ? LoadState(isVisible: false) : DayNow(),
              ),
              Expanded(
                child: Observer(
                    builder: (_) => locationController.isLoad
                        ? LoadState(isVisible: false)
                        : ListDay(listDay: locationController.weather.days)),
              ),
              Observer(
                builder: (_) => locationController.isLoad
                    ? LoadState(isVisible: false)
                    : StateWind(
                        apparentTemperature:
                            locationController.weather.apparentTemperature,
                        windSpeed: locationController.weather.windSpeed,
                      ),
              ),
              Observer(
                builder: (_) => locationController.isLoad
                    ? LoadState(isVisible: false)
                    : StateVisibility(
                        ozonio: locationController.weather.indexUv,
                        visibility: locationController.weather.visibility,
                      ),
              ),
              Rodape(),
            ],
          )
        ],
      ),
    );
  }
}
