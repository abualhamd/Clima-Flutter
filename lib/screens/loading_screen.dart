// import 'package:clima/screens/location_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:clima/services/weather.dart';

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({Key key}) : super(key: key);

//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   double latitude, longitude;

//   @override
//   void initState() {
//     getWeatherData();
//     super.initState();
//   }
  

//   Future<void> getWeatherData() async {
//     var weatherData = await WeatherModel().getLocationWeather();

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) {
//           return LocationScreen(
//             locationWeather: weatherData,
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SpinKitDoubleBounce(
//           color: Colors.white,
//           size: 80,
//         ),
//       ),
//     );
//   }
// }
import 'package:clima/screens/location_screen.dart'; 
import 'package:flutter/material.dart'; 
import 'package:flutter_spinkit/flutter_spinkit.dart'; 
import 'package:clima/services/weather.dart'; 
 class LoadingScreen extends StatefulWidget { 
  const LoadingScreen({Key? key}) : super(key: key); 
   @override 
  _LoadingScreenState createState() => _LoadingScreenState(); 
} 
 class _LoadingScreenState extends State<LoadingScreen> { 
  double? latitude; 
  double? longitude; 
   @override 
  void initState() { 
    getWeatherData(); 
    super.initState(); 
  } 
   Future<void> getWeatherData() async { 
    var weatherData = await WeatherModel().getLocationWeather(); 
    if (weatherData != null) { 
      Navigator.push( 
        context, 
        MaterialPageRoute( 
          builder: (context) { 
            return LocationScreen( 
              locationWeather: weatherData, 
            ); 
          }, 
        ), 
      ); 
    } 
  } 
   @override 
  Widget build(BuildContext context) { 
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