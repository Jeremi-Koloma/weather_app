import 'package:flutter/material.dart';

// Classe pour les informations supplementaires des prévisions
class AdditinoalInfoItems extends StatelessWidget {
  // paramètres de la classe dans le constructeur
  final IconData icon;
  final String label;
  final String value;
  const AdditinoalInfoItems(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32),
        const SizedBox(height: 8.0),
        Text(label),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
