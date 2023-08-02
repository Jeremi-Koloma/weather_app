import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_ap/secrets.dart';

import 'additional_info_items.dart';
import 'card_prevision_items.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // une fonction pour http
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      // variable pour la ville à Getter
      String cityName = "Bamako";
      // API
      final reslt = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      // Décodons l'API(le JSON) dans un variable appélé data
      final data = jsonDecode(reslt.body);

      // Vérifions si le code de l'API est différent de 200
      if (data['cod'] != '200') {
        throw "Une Erreur s'est produit !";
      }
      // Sinon si le code est == 200, on recupère la temp dans l'API
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MÉTÉO APP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          print(snapshot);
          // En chargment de l'API
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          // si l'API rencontre une erreur
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          // Si tous va bien
          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final currentTemperature = currentWeatherData['main']['temp'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card principale
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "$currentTemperature °C",
                                style: const TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Icon(
                                currentSky == "Clouds" || currentSky == "Rains"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 50.0,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "$currentSky",
                                style: const TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22.0),
                // card des Prévisions
                const Text(
                  "Prévisions horaires",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  height: 120.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final hourlyForescast = data['list'][index + 1];
                        final hourlySky =
                            data['list'][index + 1]['weather'][0]['main'];
                        final hourlyTemperature =
                            hourlyForescast['main']['temp'].toString();
                        final hourlyTime = DateTime.parse(
                            hourlyForescast['dt_txt'].toString());
                        return CardPrevisionItems(
                          houre: DateFormat.Hm().format(hourlyTime),
                          icon: hourlySky == "Clouds" || hourlySky == "Rains"
                              ? Icons.cloud
                              : Icons.sunny,
                          temperature: hourlyTemperature,
                        );
                      }),
                ),
                const SizedBox(height: 20),

                // Section Informations supplémentaires
                const Text(
                  "Informations supplémentaires",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditinoalInfoItems(
                      icon: Icons.water_drop,
                      label: "Humidité",
                      value: currentHumidity.toString(),
                    ),
                    AdditinoalInfoItems(
                      icon: Icons.air,
                      label: "Vitesse du vent",
                      value: currentWindSpeed.toString(),
                    ),
                    AdditinoalInfoItems(
                      icon: Icons.beach_access,
                      label: "Préssion",
                      value: currentPressure.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
