import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weathr_model.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = '66b383c63ed54344ab5141044242108';
  final String baseUrl = 'https://api.weatherapi.com/v1';
  WeatherService(this.dio);
  Future<WeathrModel> getCurrentWearher({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeathrModel weathrModel = WeathrModel.fromJson(response.data);

      return weathrModel;
    } on DioException catch (e) {
      final String errMassage = e.response?.data['error']['message'] ??
          'oops there was an error, try later ';
      throw Exception(errMassage);
    } catch (e) {
      log(
        e.toString(),
      );
      throw Exception('oops there was an error, try later');
    }
  }
}
