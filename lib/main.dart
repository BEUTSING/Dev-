import 'package:fist_app_mobil/pages/event_page.dart';
import 'package:flutter/material.dart';
import 'package:fist_app_mobil/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;// possition actuelle
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //liste des navbar pour chaque page
          title:[ Text("Accueil"), Text("Planification"), Text("Foirmulaire")][_currentIndex],),
        body: [
          HomePage(),
          EventPage(),
          AboutDialog()
          ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: _currentIndex,
          onTap: (index)=>setCurrentIndex(index),
          
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          elevation: 18, // decale legerement la nave bar de la page
          backgroundColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Planification',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ajout'),
          ],
        ),
      ),
    );
  }
}
