import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final kBaseUrl = 'https://api.weatherapi.com/v1';
  final kApi = 'YOUR API KEY';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$kBaseUrl/forecast.json?key=$kApi&q=$cityName&days=10',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'There was an error , please take a break and try again soon.';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(
        'There was an error , please take a break and try again soon.',
      );
    }
  }
}
