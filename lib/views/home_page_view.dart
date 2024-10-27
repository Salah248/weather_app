import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weathr_info_body.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeathrInfoBody(
              weathrModel: state.weathrModel,
            );
          } else {
            return const Text('Opps There Was An Error');
          }
        },
      ),
    );
  }
}



// to -> implement -> Blok -> pattern 
// 1 -> create states
// 2 -> create cubit
// 3 -> create function
// 4 -> provide cubit 
// 5 -> integrate cubit
// 6 -> trigger cubtit