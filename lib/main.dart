import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/conneting_provider.dart';
import 'package:weatherapp/controller/weather_provider.dart';

import 'package:weatherapp/screens/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetConnectivityProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
