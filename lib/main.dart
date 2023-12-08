import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_screen.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Step 4 Provide Cubit
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getWeatherTheme(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
  // create method getWeatherTheme that accept WeatherConditions and return color theme matches with this conditions?
}

MaterialColor getWeatherTheme(String? weatherCondition) {
  if (weatherCondition == null) return Colors.blue;
  switch (weatherCondition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
    case 'mist':
      return Colors.grey;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.yellow;
    case 'freezing fog':
    case 'fog':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.blue;
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.lightBlue;
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.blue;
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'ice pellets':
      return Colors.indigo;
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.purple;
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.deepPurple;
    default:
      // Default color for unknown conditions
      return Colors.blue;
  }
}
