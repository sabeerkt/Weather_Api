  import 'package:flutter/material.dart';
  import 'package:lottie/lottie.dart';
  import 'package:provider/provider.dart';
  import 'package:weatherapp/controller/conneting_provider.dart';
  import 'package:weatherapp/controller/weather_provider.dart';
  import 'package:weatherapp/screens/view/addtional_info.dart';
  import 'package:weatherapp/screens/view/currentWeather.dart';

  class HomePage extends StatelessWidget {
    HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      Provider.of<InternetConnectivityProvider>(context, listen: false)
          .getInternetConnectivity(context);

      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Consumer<WeatherProvider>(
                    builder: (context, value, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: TextFormField(
                              onFieldSubmitted: (String place) {
                                value.getData(place);
                              },
                              controller: value.searchController,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(top: 18, left: 10),
                                isDense: true,
                                hintText: "Search",
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Lottie.asset(
                                    'asset/search.json', // Replace with the correct path
                                    width: 26,
                                    height: 26,
                                  ),
                                ),
                                suffixIcon: value.searchController.text.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          value.searchController.clear();
                                        },
                                        icon: const Icon(
                                          Icons.cancel,
                                          color: Color.fromARGB(255, 246, 7, 7),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (value.isLoading)
                            //CircularProgressIndicator() // Show loader while loading
                            const Text(
                              "no loction ",
                              style: TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 206, 144, 125)),
                            )
                          else if (value.data != null)
                            currentWeather(
                              '${value.data!.temp}',
                              value.searchController.text.isEmpty
                                  ? "Calicut"
                                  : value.searchController.text,
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Lottie.asset(
                              'asset/sun and moon.json',
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          const Text(
                            "Additional Information",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          if (value.data != null)
                          
                            additionalInformation(
                              "${value.data!.wind}",
                              "${value.data!.humidity}",
                              "${value.data!.pressure}",
                              "${value.data!.feels_like}",
                              const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.lightBlueAccent, Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                
                              ),
                              
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
