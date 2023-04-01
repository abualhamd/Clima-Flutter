import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'location.dart';
import 'networking.dart';

final apiKey = dotenv.env['API_KEY'];
const url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherServices {
  Future<Map<String, dynamic>> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$url?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getCurrentWeather();
    return weatherData;
  }

  Future<Map<String, dynamic>> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$url?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getCurrentWeather();
    return weatherData;
  }

  // String getWeatherIcon(int condition) {
  //   if (condition < 300) {
  //     return '🌩';
  //   } else if (condition < 400) {
  //     return '🌧';
  //   } else if (condition < 600) {
  //     return '☔️';
  //   } else if (condition < 700) {
  //     return '☃️';
  //   } else if (condition < 800) {
  //     return '🌫';
  //   } else if (condition == 800) {
  //     return '☀️';
  //   } else if (condition <= 804) {
  //     return '☁️';
  //   } else {
  //     return '🤷‍';
  //   }
  // }
 }
