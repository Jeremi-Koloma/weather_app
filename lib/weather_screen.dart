import 'dart:ui';

import 'package:flutter/material.dart';

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
            const SizedBox(height: 15.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CardPrevisionItems(),
                  CardPrevisionItems(),
                  CardPrevisionItems(),
                  CardPrevisionItems(),
                  CardPrevisionItems(),
                  CardPrevisionItems(),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Section infos
            Placeholder(
              fallbackHeight: 150,
            ),
          ],
        ),
      ),
    );
  }
}

// Classe pour les cardes des prévisions
class CardPrevisionItems extends StatelessWidget {
  const CardPrevisionItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        width: 100.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Text(
              "07:00",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Icon(Icons.cloud, size: 32),
            SizedBox(height: 8.0),
            Text("32°C"),
          ],
        ),
      ),
    );
  }
}
