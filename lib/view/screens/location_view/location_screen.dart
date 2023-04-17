import 'package:clima/core/utils/extensions/media_query_extension.dart';
import 'package:clima/view/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../../../core/utils/values_manager.dart';
import 'widgets/weather_widget.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = context.width;
    final weatherModel = ref.watch(weatherModelProvider);

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
            child: Icon(
              IconsManager.locationIcon,
              size: width * ValuesManger.s0_15, 
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.cityRoute);
              },
              child: Icon(
                IconsManager.cityIcon,
                size: width * ValuesManger.s0_15,
              ),
            ),
          ],
          elevation: ValuesManger.s0,
          backgroundColor: ColorsManager.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(ImagesManager.locationBackgrounImg),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  ColorsManager.blueAccent.withOpacity(ValuesManger.s0_3),
                  BlendMode.overlay), //dsTop
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: weatherModel.when(
            data: (data) => WeatherWidget(
              weatherModel: data,
            ),
            error: ((error, stackTrace) =>
                Center(child: Text(error.toString()))), //TODO add error message
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
