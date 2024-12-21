import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/forecasst_card.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WeatherScreen> {
  var _temp;
  // initState() {  //called only once when the StatefulWidget is inserted into the widget tree.
    


  Future <Map<String,dynamic>> getCurrentWeather() async {
    try {
      final result = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=Gorakhpur,in&APPID=2deca89bf87f56a2c68f86cec0ae4c87'),
      );
      final data = jsonDecode(result.body);
      // until api is gettin fetched the valu of _temp will be zero after that it will update 
      _temp = data['main']['temp'].toString();

      if (data['cod'] != 200) {
        throw 'An unexpected error occurred';
      }
      return data;     // returning the data 
    } catch (err) {
      debugPrint(err.toString());
      throw err.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Weather App",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            // icon pressed will work
            IconButton(
              onPressed: getCurrentWeather,
              icon: const Icon(Icons.refresh),
            ),
          ]),
      body:FutureBuilder(               // when we call an api we can use this widget
        future: getCurrentWeather(),    // in this function api is getting called
        builder: (context, snapshot){  
        if(snapshot.connectionState ==ConnectionState.waiting){  // checking if waiting
          return const Center(
            child: CircularProgressIndicator(),                  // show laoding error circular
          );
        }
        if(snapshot.hasError){
          return Center(child: Text('An error occurred ${snapshot.error.toString()}'));
        }

        var data = snapshot.data;   // it will give the returned data of calling function
        var atmsphr = data?["weather"][0]["main"] ; // it could be null also that's why we are using ? mark
        var humidity = data?["main"]['humidity'];
        var pressure = data?["main"]['pressure'];
        var wind_speed = data?['wind']['speed'];
        return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: const Color.fromARGB(255, 52, 43, 43),
                child: ClipRect(
                  // it is used to apply border radius property and it clip it
                  clipBehavior: Clip.hardEdge, // border radius
                  child: BackdropFilter(
                    // used it when we make need to make the background blur
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Padding(
                      padding:const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "$_temp k",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Icon(
                            atmsphr=="Clear" ? Icons.sunny : Icons.cloud,
                            size: 64,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            atmsphr,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // const Align(
            // alignment: Alignment.topLeft,
            const Text(
              'Hourly ForeCast',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            // ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: const Row(
                children: [
                  ForeCastCard(
                    icon: Icons.cloud,
                    temp: '324',
                    time: '23434',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ForeCastCard(
                    icon: Icons.cloud,
                    temp: '324',
                    time: '23434',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ForeCastCard(
                    icon: Icons.cloud,
                    temp: '324',
                    time: '23434',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ForeCastCard(
                    icon: Icons.cloud,
                    temp: '324',
                    time: '23434',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ForeCastCard(
                    icon: Icons.cloud,
                    temp: '324',
                    time: '23434',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ForeCastCard(
                    icon: Icons.cloud,
                    temp: '324',
                    time: '23434',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.water_drop,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "humidity",
                        style:TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        humidity.toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.air,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Wind Speed',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        wind_speed.toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.beach_access,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Pressure',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        pressure.toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      }
     ),
    );
  }
}
