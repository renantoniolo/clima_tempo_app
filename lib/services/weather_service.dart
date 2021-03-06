import 'dart:convert';
import 'package:clima_tempo_app/models/weather.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class WeatherService {
  String _key;
  String _keyGoogle;

  WeatherService() {
    _loadFile();
  }

  _loadFile() async {
    // carrega as keys das api
    await GlobalConfiguration().loadFromAsset("app_settings.json");
    _key = GlobalConfiguration().getDeepValue("keyApi");
    _keyGoogle = GlobalConfiguration().getDeepValue("keyGoogle");
  }

  Future<Weather> getTemperature(double lati, double longe) async {
    var url =
        "https://api.darksky.net/forecast/${_key.toString()}/${lati.toString()},${longe.toString()}?lang=pt&units=ca&exclude=hourly,alerts,flags";

    http.Response response = await http.get(url);

    return _decode(response);
  }

  Future<String> getCity(double lati, double longe) async {
    var url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${lati.toString()},${longe.toString()}&key=${_keyGoogle.toString()}";

    http.Response response = await http.get(url);

    return _decodeCity(response);
  }

  String _decodeCity(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      var nameCity =
          decoded["results"][3]["address_components"][3]["long_name"];

      // verifica se veio algo
      if (nameCity.isEmpty || nameCity == null) return "Brasil";

      return nameCity;
    } else
      return "Error";
  }

  Weather _decode(http.Response response) {
    try {
      Weather weather = Weather();
      if (response.statusCode == 200) {
        // ok

        var decoded = json.decode(response.body);

        weather.latitude = decoded["latitude"];
        weather.longitude = decoded["longitude"];
        weather.timezone = decoded["timezone"];
        weather.temperature = decoded["currently"]["temperature"];
        weather.summary = decoded["currently"]["summary"];
        weather.apparentTemperature =
            decoded["currently"]["apparentTemperature"];
        weather.windSpeed = decoded["currently"]["windSpeed"];
        weather.visibility = decoded["currently"]["visibility"];
        weather.indexUv = decoded["currently"]["uvIndex"];
        weather.days = List<WeatherDay>();

        // inicializa o formato de date/hr
        const locale = "pt_BR";
        initializeDateFormatting(locale).then((_) {});

        for (int i = 0; i < 7; i++) {
          WeatherDay _weatherDay = WeatherDay();
          var date = new DateTime.now();
          _weatherDay.day = new DateFormat.EEEE(locale)
              .format(new DateTime(date.year, date.month, date.day + 1 + i));
          _weatherDay.temperatureMin = decoded["daily"]["data"][i]
                      ["apparentTemperatureMin"]
                  .toStringAsFixed(0) +
              "°";
          _weatherDay.temperatureMax = decoded["daily"]["data"][i]
                      ["apparentTemperatureMax"]
                  .toStringAsFixed(0) +
              "°";
          weather.days.add(_weatherDay);
        }
        return weather;
      } else {
        // error
        return null;
      }
    } catch (e) {
      // exception
      return null;
    }
  }
}
