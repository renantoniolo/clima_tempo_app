import 'package:clima_tempo_app/controller/weather_controller.dart';
import 'package:clima_tempo_app/models/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:connectivity/connectivity.dart';
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
  bool isConnection = true;

  @observable
  Weather weather = Weather();

  @action
  Future getGeoLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print("Latitude:" +
        position?.latitude.toString() +
        "Longitude:" +
        position?.longitude.toString());

    if (position == null) {
      print("não é possível acessar a geolocalização!");
      isLoad = true;
      return;
    }

    isLoad = await _weatherRequest(position.latitude, position.longitude);
  }

  @action
  Future getConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnection = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      isConnection = false;
    }
  }

  Future<bool> _weatherRequest(double lat, double long) async {
    // Pega a temperatura atual
    await weatherController.getWeather(lat, long);

    // caso a webApi retorne null
    if (weatherController.weather == null) return true;

    // retorna a temperatura atual
    weather = weatherController.weather;

    // retorna o nome da cidade
    cityName = weatherController.cityName;

    return false;
  }
}
