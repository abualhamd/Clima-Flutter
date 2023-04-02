import 'package:clima/view/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:clima/core/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/snackbar_popup.dart';

class CityScreen extends ConsumerWidget {
  CityScreen({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter City',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (controller.text.isNotEmpty) {
                    await ref
                        .read(weatherModelProvider.notifier)
                        .updateCityWeatherModel(cityName: controller.text);
                    FocusScope.of(context).unfocus();
                    await Future.delayed(const Duration(milliseconds: Constants.waitBeforeReturningToLocationScreen));

                    Navigator.pop(context);
                  } else {
                    displaySnackBar(context, 'Please Enter a city name');
                  }
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
