import 'package:clima/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'components/background_arrow.dart';
import 'components/city_textfield.dart';
import 'components/get_weather_button.dart';

class CityScreen extends StatelessWidget {
  CityScreen({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesManager.cityBackgroundImg),
              fit: BoxFit.cover,
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: Column(
              children: <Widget>[
                const BackgroundArrow(),
                CityTextField(controller: controller),
                GetWeatherButton(controller: controller),
              ],
            ),
          
        ),
      ),
    );
  }
}