import 'package:flutter/material.dart';

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
