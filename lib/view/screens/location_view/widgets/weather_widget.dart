import 'package:clima/core/utils/extensions/media_query_extension.dart';
import 'package:clima/core/utils/extensions/weather_map_icon.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/values_manager.dart';
import '../../../../models/weather_model.dart';
import '../../../../core/utils/constants.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key, required WeatherModel weatherModel})
      : _weatherModel = weatherModel,
        super(key: key);
  final WeatherModel _weatherModel;

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    return Column(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            height: width * ValuesManger.s0_55,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * ValuesManger.s0_03), //15.0
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${_weatherModel.temprature}°',
                  style: kTempTextStyle,
                ),
                Image.network(
                  _weatherModel.icon.getWeatherMapIconLink,
                  // TODO
                  // errorBuilder: ,
                  // frameBuilder: ,
                  // loadingBuilder: ,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * ValuesManger.s0_05),
            child: Text(
              // TODO
              "${_weatherModel.description} in ${_weatherModel.cityName}!",
              softWrap: true,
              // maxLines: 3,
              textAlign: TextAlign.right,
              style: kMessageTextStyle,
            ),
          ),
        ]),
      ],
    );
  }
}
