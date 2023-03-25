// import 'package:flutter/material.dart';
// import 'package:clima/utilities/constants.dart';
// import 'package:clima/services/weather.dart';
// import 'city_screen.dart';

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({Key key, this.locationWeather}) : super(key: key);
//   final locationWeather;
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   WeatherModel weatherModel = WeatherModel();
//   int temprature;
//   String cityName, weatherMessage, weatherIcon;
//   @override
//   void initState() {
//     updateUI(widget.locationWeather);
//     super.initState();
//   }

//   void updateUI(dynamic weatherData) {
//     setState(() {
//       if (weatherData == null) {
//         cityName = '';
//         temprature = 0;
//         weatherMessage = 'Unable to get weather data';
//         weatherIcon = 'Error';
//         return;
//       }
//       cityName = weatherData['name'];
//       double temp = weatherData['main']['temp'];
//       temprature = temp.toInt();
//       int condition = weatherData['weather'][0]['id'];
//       weatherIcon = weatherModel.getWeatherIcon(condition);
//       weatherMessage = weatherModel.getMessage(condition);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/location_background.jpg'),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//                 Colors.white.withOpacity(0.8), BlendMode.dstATop),
//           ),
//         ),
//         constraints: BoxConstraints.expand(),
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: () async {
//                       var weatherData = await weatherModel.getLocationWeather();
//                       updateUI(weatherData);
//                     },
//                     child: Icon(
//                       Icons.near_me,
//                       size: 50.0,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () async {
//                       var typedName = await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return CityScreen();
//                           },
//                         ),
//                       );
//                       if (typedName != null) {
//                         var weatherData =
//                             await weatherModel.getCityWeather(typedName);
//                         updateUI(weatherData);
//                       }
//                     },
//                     child: Icon(
//                       Icons.location_city,
//                       size: 50.0,
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 15.0),
//                 child: Row(
//                   children: <Widget>[
//                     Text(
//                       '$temprature°',
//                       style: kTempTextStyle,
//                     ),
//                     Text(
//                       weatherIcon,
//                       style: kConditionTextStyle,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 15.0),
//                 child: Text(
//                   "$weatherMessage in $cityName!",
//                   textAlign: TextAlign.right,
//                   style: kMessageTextStyle,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';
 class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, required this.locationWeather}) : super(key: key);
   final locationWeather;
  // String CityName = locationWeather['name'];
   @override
  _LocationScreenState createState() => _LocationScreenState();
}
 class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temprature;
  String? cityName, weatherMessage, weatherIcon;
   @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }
   void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = '';
        temprature = 0;
        weatherMessage = 'Unable to get weather data';
        weatherIcon = 'Error';
         return;
      }
      cityName = weatherData['name'];
      double temp = weatherData['main']['temp'];
      temprature = temp.toInt();
      int condition = weatherData['weather'][0]['id'];
       weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMessage = weatherModel.getMessage(condition);
    });
  }
   @override
  Widget build(BuildContext context) {
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
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final String typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CityScreen();
                          },
                        ),
                      );
                      print(typedName);
                      if (typedName != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temprature ?? ''}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon ?? '',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in ${cityName ?? ''}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}