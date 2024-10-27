import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weathr_model.dart';

class WeathrInfoBody extends StatelessWidget {
  const WeathrInfoBody({super.key, required this.weathrModel});
  final WeathrModel weathrModel;

  @override
  Widget build(BuildContext context) {
    weathrModel.image!.contains('https');
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weathrModel.weatherCondation),
          getThemeColor(weathrModel.weatherCondation)[300]!,
          getThemeColor(weathrModel.weatherCondation)[50]!,
        ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weathrModel.cityName,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "updated at ${weathrModel.date.hour} : ${weathrModel.date.minute}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https:${weathrModel.image}'),
                  const SizedBox(
                    width: 32,
                  ),
                  Text(
                    weathrModel.temp.toString(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Column(
                    children: [
                      Text(
                        "maxTemp:${weathrModel.maxTemp.round()}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "minTemp:${weathrModel.minTemp.round()}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                weathrModel.weatherCondation,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
