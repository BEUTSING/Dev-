import 'package:flutter/material.dart';
 
class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("planning du salon 2026"),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Text("prochainement disponible")),
    );
  }
}