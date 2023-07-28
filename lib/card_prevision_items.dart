import 'package:flutter/material.dart';

// Classe pour les cardes des prévisions
class CardPrevisionItems extends StatelessWidget {
  // paramètre de la classe dans le constructeur
  final String houre;
  final IconData icon;
  final String temperature;
  const CardPrevisionItems(
      {super.key,
      required this.houre,
      required this.icon,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        width: 100.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              houre,
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Icon(icon, size: 32),
            const SizedBox(height: 8.0),
            Text(temperature),
          ],
        ),
      ),
    );
  }
}
