import 'package:clima/view/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/utils/routes_manager.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // the Future.delayed is to await till the build method has completed
    Future.delayed(Duration.zero, () async {
      await ref
          .read(weatherModelProvider.notifier)
          .updateLocationWeatherModel();
      Navigator.pushNamed(context, Routes.locationRoute);
    });
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
