import 'dart:convert';
import 'package:clima_tempo_app/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class WeatherService {

  //"https://api.darksky.net/forecast/faa103b5b3681ade900c611c71095265/37.421998,-122.084?lang=pt&units=ca&exclude=hourly,alerts,flags"

  String _key = "faa103b5b3681ade900c611c71095265";

  Future<Weather> getTemperature(double lati, double longe) async {

    var url = "https://api.darksky.net/forecast/" +
        _key +
        "/" +
        lati.toString() +
        "," +
        longe.toString() +
        "?lang=pt&units=ca&exclude=hourly,alerts,flags";

   //var url = "https://api.darksky.net/forecast/faa103b5b3681ade900c611c71095265/37.421998,-122.084?lang=pt&units=ca&exclude=hourly,alerts,flags";

    http.Response response = await http.get(url);

    return decode(response);
  }

  Weather decode(http.Response response) {

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
          _weatherDay.temperatureMin =
              decoded["daily"]["data"][i]["apparentTemperatureMin"];
          _weatherDay.temperatureMax =
              decoded["daily"]["data"][i]["apparentTemperatureMax"];
          weather.days.add(_weatherDay);
        }
      }

      return weather;

    } catch (e) {
      Weather weather = Weather();
      return weather;
    }
  }
}
