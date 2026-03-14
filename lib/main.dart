import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Asynconf 2026"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Image.asset("assets/images/"),
              Text("Asynconf 2026", 
              style: TextStyle(fontSize: 45,
              fontFamily: 'poppins'),
              ),
              Text("Salon virtuel de l'informatique. Du 27 au 29 octobre 2026 et  plus", 
              style: TextStyle(fontSize: 24
              ),
              textAlign: TextAlign.center,
              ),
              
            ],
          )
          

        ) 
      ),
    );
  }
}