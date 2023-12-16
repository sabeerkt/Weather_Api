import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

Widget additionalInformation(
  String wind,
  String humidity,
  String pressure,
  String feelsLike,
  BoxDecoration backgroundDecoration,
) {
  return SizedBox(
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        color: Colors.transparent,
        child: Container(
          decoration: backgroundDecoration,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildWeatherInfo(
                    animationPath:
                        'asset/windddddddd.json', // Replace with your Lottie animation file path
                    label: 'Wind',
                    value: wind,
                  ),
                  _buildWeatherInfo(
                    animationPath:
                        'asset/press.json', // Replace with your Lottie animation file path
                    label: 'Pressure',
                    value: pressure,
                  ),
                  _buildWeatherInfo(
                    animationPath:
                        'asset/real feel.json', // Replace with your Lottie animation file path
                    label: 'Humidity',
                    value: humidity,
                  ),
                  _buildWeatherInfo(
                    animationPath:
                        'asset/humdity.json', // Replace with your Lottie animation file path
                    label: 'Real Feel',
                    value: feelsLike,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildWeatherInfo({
  required String animationPath,
  required String label,
  required String value,
}) {
  return Column(
    children: [
      Lottie.asset(
        animationPath,
        height: 100, // Adjust the height according to your needs
        width: 100, // Adjust the width according to your needs
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 10),
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
  );
}
