class WeathrModel {
  final String cityName;
  final DateTime date;
  String? image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondation;

  WeathrModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondation});

  factory WeathrModel.fromJson(json) {
    return WeathrModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondation: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']["icon"],
    );
  }
}
