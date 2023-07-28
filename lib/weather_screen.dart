import 'dart:ui';

import 'package:flutter/material.dart';

import 'additional_info_items.dart';
import 'card_prevision_items.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
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
                        children: const [
                          Text(
                            "300°C",
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Icon(
                            Icons.cloud,
                            size: 50.0,
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Pluie",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // card des Prévisions
            const Text(
              "Prévisions météorologiques",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CardPrevisionItems(
                    houre: "06:18",
                    icon: Icons.cloud,
                    temperature: "06°C",
                  ),
                  CardPrevisionItems(
                    houre: "07:18",
                    icon: Icons.cloud,
                    temperature: "15°C",
                  ),
                  CardPrevisionItems(
                    houre: "08:18",
                    icon: Icons.cloud,
                    temperature: "17°C",
                  ),
                  CardPrevisionItems(
                    houre: "09:18",
                    icon: Icons.cloud,
                    temperature: "23°C",
                  ),
                  CardPrevisionItems(
                    houre: "10:18",
                    icon: Icons.cloud,
                    temperature: "26°C",
                  ),
                  CardPrevisionItems(
                    houre: "11:18",
                    icon: Icons.cloud,
                    temperature: "32°C",
                  ),
                ],
              ),
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
              children: const [
                AdditinoalInfoItems(
                  icon: Icons.water_drop,
                  label: "Humidité",
                  value: "321°",
                ),
                AdditinoalInfoItems(
                  icon: Icons.air,
                  label: "Vitesse du vent",
                  value: "7.9°",
                ),
                AdditinoalInfoItems(
                  icon: Icons.beach_access,
                  label: "Préssion",
                  value: "1000°",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
