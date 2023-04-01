class WeatherModel {
  String cityName;
  int temp;
  String cond;

  WeatherModel(
      {required this.cityName, required this.temp, required this.cond});

  factory WeatherModel.fromJson({required Map<String, dynamic> json}) {
    double tempDouble = json['main']['temp'];
    return WeatherModel(
        cityName: json['name'],
        temp: tempDouble.toInt(),
        cond: json['weather'][0]['main']);
  }
}
