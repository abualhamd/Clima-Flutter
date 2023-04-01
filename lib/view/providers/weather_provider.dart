import 'dart:async';

import 'package:clima/models/weather_model.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherModelProvider =
    AsyncNotifierProvider<WeatherNotifier, WeatherModel>(WeatherNotifier.new);

class WeatherNotifier extends AsyncNotifier<WeatherModel> {
  late WeatherModel _model;

  @override
  FutureOr<WeatherModel> build() {
    return _model;
  }

  Future<void> updateLocationWeatherModel() async {
    state = const AsyncLoading();
    Future<AsyncValue<WeatherModel>> future = AsyncValue.guard(() async {
      final json = await ref.read(locationProvider.notifier).updateLocation();
      return WeatherModel.fromJson(json: json);
    });
    state = await future;
  }

  Future<void> updateCityWeatherModel({required String cityName}) async {
    state = const AsyncLoading();
    Future<AsyncValue<WeatherModel>> future = AsyncValue.guard(() async {
      final json =
          await ref.read(cityProvider.notifier).updateCity(cityName: cityName);
      return WeatherModel.fromJson(json: json);
    });
    state = await future;
  }
}


final locationProvider =
    NotifierProvider<LocationNotifier, Map<String, dynamic>>(
        LocationNotifier.new);

class LocationNotifier extends Notifier<Map<String, dynamic>> {
  @override
  build() {
    return {};
  }

  Future<Map<String, dynamic>> updateLocation() async {
    return await WeatherServices().getLocationWeather();
  }
}

final cityProvider =
    NotifierProvider<CityProvider2, Map<String, dynamic>>(CityProvider2.new);

class CityProvider2 extends Notifier<Map<String, dynamic>> {
  @override
  build() {
    return {};
  }

  Future<Map<String, dynamic>> updateCity({required String cityName}) async {
    return await WeatherServices().getCityWeather(cityName);
  }
}
// TODO replace the two instances of the WeatherServices