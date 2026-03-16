
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fist_app_mobil/pages/event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asynconf 2026"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //insert image in svg format and png format
            SvgPicture.asset("assets/images/logo.svg", width: 200, height: 200),
            Image.asset("assets/images/logo.png", width: 200, height: 200),
            Text(
              "Asynconf 2026",
              style: TextStyle(fontSize: 45, fontFamily: 'poppins'),
            ),
            Text(
              "Salon virtuel de l'informatique. Du 27 au 29 octobre 2026 et  plus",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
// espace entre le texte et le bouton
            Padding(padding: EdgeInsets.all(  20)),
            // si on ne veux pas l'icon on peut utiliser ElevatedButton au lieu de ElevatedButton.icon et supprimer la partie icon: Icon(Icons.calendar_month) 
            //et remplacer le label: Text("afficherplanning",style: TextStyle(fontSize: 20),) par child: Text("afficherplanning",style: TextStyle(fontSize: 20),)
            ElevatedButton.icon(
              //couleur du bouton
              style: ButtonStyle(
                // espace  a l'intérieur du bouton
                padding: MaterialStateProperty.all(EdgeInsets.all(20 )), 
                backgroundColor: MaterialStateProperty.all(Colors.green),
                 
              ),
              onPressed: () {
                //naviguer vers la page de planning
                Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => EventPage())
                );
                }, 
            label: Text("afficherplanning",style: TextStyle(fontSize: 20),
            ),
            icon: Icon(Icons.calendar_month) , 
            )
          ],
        ),
      ),
    );
  }
}
