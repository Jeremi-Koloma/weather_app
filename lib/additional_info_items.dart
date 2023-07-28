import 'package:flutter/material.dart';

// Classe pour les informations supplementaires des prévisions
class AdditinoalInfoItems extends StatelessWidget {
  const AdditinoalInfoItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.water_drop, size: 32),
        SizedBox(height: 8.0),
        Text("Humidité"),
        SizedBox(height: 8.0),
        Text(
          "321°",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
