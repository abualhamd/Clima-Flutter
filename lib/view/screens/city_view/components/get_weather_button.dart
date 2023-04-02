import 'package:clima/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/snackbar_popup.dart';
import '../../../providers/weather_provider.dart';

class GetWeatherButton extends ConsumerWidget {
  const GetWeatherButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () async {
        if (controller.text.isNotEmpty) {
          await ref
              .read(weatherModelProvider.notifier)
              .updateCityWeatherModel(cityName: controller.text);
          FocusScope.of(context).unfocus();
          await Future.delayed(const Duration(milliseconds: Constants.waitBeforeReturningToLocationScreen));
          Navigator.pop(context);
        } else {
          displaySnackBar(context, AppStrings.snackbarMessage);
        }
      },
      child: const Text(
        AppStrings.getWeather,
        style: kButtonTextStyle,
      ),
    );
  }
}

