class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double minTemperature;
  final double maxTemperature;
  final String image;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.minTemperature,
    required this.maxTemperature,
    required this.image,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']
          ['avgtemp_c'], // Used index 0 Due to nameless list
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      minTemperature: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemperature: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
