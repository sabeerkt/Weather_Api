import 'package:flutter/material.dart';

Widget currentWeather(String temp, String location) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5.0, // Set the elevation for the card
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Set border radius for the card
        ),
        child: Container(
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white], // Set gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(
                15.0), // Set border radius for the container
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                temp,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
