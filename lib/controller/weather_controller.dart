import 'package:clima_tempo_app/models/weather.dart';
import 'package:clima_tempo_app/services/weather_service.dart';
import 'package:mobx/mobx.dart';
part 'weather_controller.g.dart';

class WeatherController = _WeatherController with _$WeatherController; 

abstract class _WeatherController with Store {

  final WeatherService _watservice = WeatherService();

  @observable
  bool isLoad = true;

  @observable
  Weather weather;

  @action
  Future getWeather(double lat, double long) async {

    try{
      isLoad = true;
      weather = await _watservice.getTemperature(lat,long);
      isLoad = weather == null ? false : true;
    }
    catch(e) {
      print(e);
    }

  }

}

//flutter packages pub run build_runner build