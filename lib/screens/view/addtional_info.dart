import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

Widget additionalInformation(
  String wind,
  String humidity,
  String pressure,
  String feelsLike,
) {
  return SizedBox(
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            // Wrap Row with SingleChildScrollView
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildWeatherInfo(
                  iconPath: 'asset/wind.jpg',
                  label: 'Wind',
                  value: wind,
                ),
                _buildWeatherInfo(
                  iconPath: 'asset/magnifier_182957.png',
                  label: 'Pressure',
                  value: pressure,
                ),
                _buildWeatherInfo(
                  iconPath: 'asset/magnifier_182957.png',
                  label: 'Humidity',
                  value: humidity,
                ),
                _buildWeatherInfo(
                  iconPath: 'asset/magnifier_182957.png',
                  label: 'Real Feel',
                  value: feelsLike,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildWeatherInfo({
  required String iconPath,
  required String label,
  required String value,
}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(iconPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
