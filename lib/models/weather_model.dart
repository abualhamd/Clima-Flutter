class WeatherModel {
  String cityName;
  int temprature;
  String description;
  String icon;

  WeatherModel(
      {required this.cityName,
      required this.temprature,
      required this.description,
      required this.icon});

  factory WeatherModel.fromJson({required Map<String, dynamic> json}) {
    double tempDouble = json['main']['temp'];
    return WeatherModel(
      cityName: json['name'],
      temprature: tempDouble.toInt(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
