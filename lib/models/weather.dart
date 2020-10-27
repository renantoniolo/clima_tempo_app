class Weather {
  double latitude;
  double longitude;
  String timezone;
  String summary;
  double temperature;
  double apparentTemperature;
  double windSpeed;
  double visibility;
  int indexUv;
  List<WeatherDay> days;
}

class WeatherDay {
  String day;
  String temperatureMin;
  String temperatureMax;
}
