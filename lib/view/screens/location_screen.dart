import 'package:clima/view/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/routes_manager.dart';
import 'widgets/weather_widget.dart';

class LocationScreen extends ConsumerWidget {

  const LocationScreen({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var weatherModel = ref.watch(weatherModelProvider);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: TextButton(
            onPressed: () async {
              await ref
                  .read(weatherModelProvider.notifier)
                  .updateLocationWeatherModel();
            },
            child: const Icon(
              Icons.near_me,
              size: 50.0,
            ),
          ),
          actions: [
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
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
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
          child: weatherModel.when(
            data: (data) => WeatherWidget(
              weatherModel: data,
            ),
            error: ((error, stackTrace) => Center(child: Text(error.toString()))),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
