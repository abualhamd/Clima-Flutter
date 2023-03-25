// import 'package:flutter/material.dart';
// import 'package:clima/utilities/constants.dart';

// class CityScreen extends StatefulWidget {
//   const CityScreen({Key? key}) : super(key: key);

//   @override
//   _CityScreenState createState() => _CityScreenState();
// }

// class _CityScreenState extends State<CityScreen> {
//   String cityName;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/city_background.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         constraints: BoxConstraints.expand(),
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.pop(
//                       context,
//                     );
//                   },
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 50.0,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: TextField(
//                   onChanged: (value) {
//                     cityName = value;
//                   },
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Enter City',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                     ),
//                     icon: Icon(
//                       Icons.location_city,
//                       color: Colors.white,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context, cityName);
//                 },
//                 child: Text(
//                   'Get Weather',
//                   style: kButtonTextStyle,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
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
                  onChanged: (value) {
                    cityName = value;
                  },
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
                onPressed: () {
                  if (cityName != null) {
                    Navigator.pop(context, cityName);
                  }else {
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

void displaySnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
