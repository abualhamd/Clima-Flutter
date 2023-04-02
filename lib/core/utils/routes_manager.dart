import 'package:clima/view/screens/city_view/city_screen.dart';
import 'package:clima/view/screens/loading_view/loading_screen.dart';
import 'package:clima/view/screens/location_view/location_screen.dart';
import 'package:flutter/material.dart';
import 'app_strings.dart';

abstract class Routes {
  static const String splashRoute = '/';
  static const String locationRoute = '/locationRoute';
  static const String cityRoute = '/cityRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>  const LoadingScreen());
      case Routes.locationRoute:
        return MaterialPageRoute(builder: (_) =>  const LocationScreen());
      case Routes.cityRoute:
        return MaterialPageRoute(builder: (_) =>  CityScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.undefinedRoute)),
        body: const Center(child: Text(AppStrings.undefinedRoute)),
      ),
    );
  }
}