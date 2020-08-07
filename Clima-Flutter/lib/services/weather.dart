import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const WEATHER_API_KEY = "895084275cd62e1195cab831822794b2";
const OPEN_WEATHER_MAP_URL = "https://api"
    ".openweathermap"
    ".org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getWeatherByCityName(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: OPEN_WEATHER_MAP_URL +
            "?q=$cityName&appid=$WEATHER_API_KEY&units=metric");

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    ClimaLocation location = ClimaLocation();
    await location.getCurrentLocation(); //cekamo vrednosti kako bi mogli da
    // ih printamo
    NetworkHelper networkHelper = NetworkHelper(
        url: OPEN_WEATHER_MAP_URL +
            "?lat=${location.latitude}&lon=${location.longitude}&appid"
                "=$WEATHER_API_KEY&units=metric");

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
