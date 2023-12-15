import 'package:flutter/material.dart';

 currentWeather(String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "$temp",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "$location",
          style: const TextStyle(
            fontSize: 18.0,
          ),
        )
      ],
    ),
  );
}
