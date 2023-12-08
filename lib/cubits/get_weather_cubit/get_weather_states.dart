// Step 1 Create States (We can know our all States from Ui logically screens)

import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {
  final String errorMessage;

  WeatherFailureState({required this.errorMessage});
}

class WeatherInitialState extends WeatherStates {}
