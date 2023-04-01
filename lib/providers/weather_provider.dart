import 'package:clima/models/weather_model.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final weatherModelProvider = FutureProvider<WeatherModel>((ref) async {
  final cityName = ref.watch(cityProvider);
  final json = await WeatherServices().getCityWeather(cityName);
  return WeatherModel.fromJson(json: json);
});

final cityProvider = NotifierProvider<CityProvider, String>(CityProvider.new);//..call().changeCity(newCity: 'cairo')

class CityProvider extends Notifier<String> {
  @override
  build() {
    return '';
  }

  void changeCity({required String newCity}) => state = newCity;
}
