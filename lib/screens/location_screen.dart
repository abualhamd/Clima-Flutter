import 'package:clima/models/weather_model.dart';
import 'package:clima/providers/weather_provider.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/utils/routes_manager.dart';
import '../utilities/constants.dart';

class LocationScreen extends ConsumerWidget {
  final WeatherServices weatherServices = WeatherServices();

  LocationScreen({Key? key}) : super(key: key);//todo const

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var weatherModel = ref.watch(weatherModelProvider);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData =
                          await weatherServices.getLocationWeather();
                      ref
                          .read(cityProvider.notifier)
                          .changeCity(newCity: weatherData['name']);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.cityRoute);
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              weatherModel.when(
                  data: (data) => WeatherWidget(
                        weatherModel: data,
                      ),
                  error: ((error, stackTrace) => Text(error.toString())),
                  loading: () => const CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget(
      {Key? key,
      required WeatherModel weatherModel})
      : _weatherModel = weatherModel,
        super(key: key);
  final WeatherModel _weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: <Widget>[
              Text(
                '${_weatherModel.temp}°',
                style: kTempTextStyle,
              ),
              // Text(
              //   weatherIcon ?? '',//TODO
              //   style: kConditionTextStyle,
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Text(
            // TODO
            "weatherMessage in ${_weatherModel.cityName}!",
            textAlign: TextAlign.right,
            style: kMessageTextStyle,
          ),
        ),
      ],
    );
  }
}
