import 'package:clima_tempo_app/controller/weather_controller.dart';
import 'package:clima_tempo_app/models/weather.dart';
import 'package:mobx/mobx.dart';
import 'package:geolocator/geolocator.dart';
part 'geolocation_controller.g.dart';

class GeolocationController = _GeolocationController
    with _$GeolocationController;

abstract class _GeolocationController with Store {
  final weatherController = WeatherController();
  bool status = false;

  @observable
  String cityName = "- -";

  @observable
  bool isLoad = true;

  @observable
  Weather weather = Weather();

  @action
  void getGeoLocation() async {

    isLoad = true;

    var position = await getLastKnownPosition();

    print("Latitude:" + position?.latitude.toString() 
    + "Longitude:" + position?.longitude.toString() );

    if (position == null) return;

    await _weatherRequest(position.latitude, position.longitude);
     
    isLoad = false;

  }

  _weatherRequest(double lat, double long) async {
    
    // Pega a temperatura atual
    await weatherController.getWeather(lat, long);

    // retorna a temperatura atual
    weather = weatherController.weather;

    // retorna o nome da cidade 
    cityName = weatherController.cityName;

  }

}
