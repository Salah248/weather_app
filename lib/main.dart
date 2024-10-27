import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/home_page_view.dart';
import 'package:weather_app/weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/weather_cubit/get_weather_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: false,
                  primaryColor: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weathrModel
                        ?.weatherCondation,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomePageView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.blue;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.cyan;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
      return Colors.lightGreen;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Blizzard':
    case 'Heavy snow':
    case 'Moderate or heavy snow':
      return Colors.indigo;
    case 'Moderate or heavy rain':
    case 'Heavy rain':
      return Colors.teal;
    case 'Torrential rain shower':
      return Colors.blue;
    default:
      return Colors.blueGrey; // لون افتراضي في حالة عدم المطابقة
  }
}
