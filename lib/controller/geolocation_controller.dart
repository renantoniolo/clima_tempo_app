import 'package:clima_tempo_app/controller/weather_controller.dart';
import 'package:clima_tempo_app/models/weather.dart';
import 'package:mobx/mobx.dart';
import 'package:geolocator/geolocator.dart';
part 'geolocation_controller.g.dart';


class GeolocationController = _GeolocationController
    with _$GeolocationController;

abstract class _GeolocationController with Store {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final weatherController = WeatherController();
  
  @observable
  String cityName = "";

  @observable
  bool isLoad = true;

  @observable
  Weather weather = Weather();

  @action
  void getGeoLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {
      
      isLoad = true;

      // Retorna a cidade
      _getAddressFromLatLng(position.latitude, position.longitude);

      // Pega a temperatura atual
      await weatherController.getWeather(position.latitude, position.longitude);

      // retorna a temperatura atual
      weather = weatherController.weather;

      isLoad = false;

    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng(double lat, double long) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(lat, long);

      Placemark place = p[0];
      cityName = "${place.locality}" == "" ? "${place.subAdministrativeArea}" : "${place.locality}" ;
    } catch (e) {
      print(e);
    }
  }
}
