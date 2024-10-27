import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weathr_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/weather_cubit/get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeathrModel? weathrModel;
  getWeather({required String cityName}) async {
    try {
      WeathrModel weathrModel =
          await WeatherService(Dio()).getCurrentWearher(cityName: cityName);

      emit(
        WeatherLoadedState(weathrModel),
      );
    } on Exception {
      emit(
        WeatherFailureState(e.toString()),
      );
    }
  }
}
