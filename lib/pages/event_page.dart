// import 'package:flutter/material.dart';

// class EventPage extends StatefulWidget {
//   const EventPage({super.key});

//   @override
//   State<EventPage> createState() => _EventPageState();
// }

// class _EventPageState extends State<EventPage> {
//   final events = [
//     {
//       "speaker": "John Doe",
//       "avatar": "assets/images/elon.jpeg",
//       "date": "27 octobre 2026",
//       "title": "Conférence d'ouverture",
//       "description":
//           "Discours d'ouverture par les organisateurs et présentation du programme du salon.",
//     },
//     {
//       "speaker": "Jane Smith",
//       "avatar": "assets/images/download.png",
//       "date": "28 octobre 2026",
//       "title": "Ateliers et démonstrations",
//       "description":
//           "Ateliers pratiques et démonstrations de nouvelles technologies dans le domaine de l'informatique.",
//     },
//     {
//       "speaker": "Alice Johnson",
//       "avatar": "assets/images/download.jfif",
//       "date": "29 octobre 2026",
//       "title": "Conférence de clôture",
//       "description":
//           "Résumé des événements du salon et discours de clôture par les organisateurs.",
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ListView.builder(
//         itemCount: events.length,
//         itemBuilder: (context, index) {
//           final event = events[index];
//           final avatar = event['avatar'];
//           final date = event['date'];
//           final title = event['title'];
//           final description = event['description'];

//           return Card(
//             child: ListTile(
//               leading: Image.asset('$avatar', width: 50, height: 50),
//               trailing: Icon(Icons.add),
//               title: Text(
//                 "$title",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("$date", style: TextStyle(color: Colors.blue)),
//                   SizedBox(height: 5),
//                   Text("$description"),
//                 ],
//               ),
//             ),
//           );
//         },
//         // children: [
//         //   Card(
//         //     child: ListTile(
//         //       leading: FlutterLogo(size: 50),
//         //       trailing: Icon(Icons.more),
//         //       title: Text("27 octobre 2026"),
//         //       subtitle: Text("Conférence d'ouverture"),
//         //     ),
//         //   ),
//         //   Card(
//         //     child: ListTile(
//         //       leading: Image.asset(
//         //         'assets/images/elon.jpeg',
//         //         width: 50,
//         //         height: 50,
//         //       ),
//         //       trailing: Icon(Icons.more_vert),
//         //       title: Text("27 octobre 2026"),
//         //       subtitle: Text("Conférence d'ouverture"),
//         //     ),
//         //   ),
//         //   Card(
//         //     child: ListTile(
//         //       leading: Image.asset(
//         //         'assets/images/download.png',
//         //         width: 50,
//         //         height: 50,
//         //       ),
//         //       trailing: Icon(Icons.more_vert),
//         //       title: Text("27 octobre 2026"),
//         //       subtitle: Text("Conférence d'ouverture"),
//         //     ),
//         //   ),
//         //   Card(
//         //     child: ListTile(
//         //       leading: Image.asset(
//         //         'assets/images/download.jfif',
//         //         width: 50,
//         //         height: 50,
//         //       ),
//         //       trailing: Icon(Icons.more_vert),
//         //       title: Text("27 octobre 2026"),
//         //       subtitle: Text("Conférence d'ouverture"),
//         //     ),
//         //   ),

//         //   ListTile(
//         //     leading: Icon(Icons.event),
//         //     title: Text("28 octobre 2026"),
//         //     subtitle: Text("Ateliers et démonstrations"),
//         //   ),
//         //   ListTile(
//         //     leading: Icon(Icons.event),
//         //     title: Text("29 octobre 2026"),
//         //     subtitle: Text("Conférence de clôture"),
//         //   ),
//         // ],
//       ),
//     );
//     Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey, // ✅ IMPORTANT pour la validation
//           child: Column(
//             children: [
//               // 📌 Champ Nom Conférence
//               Container(
//                 margin: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   controller: confNameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Nom Conférence',
//                     hintText: 'Entrer le nom de la conférence',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     // ✅ Vérification si vide
//                     if (value == null || value.isEmpty) {
//                       return 'Tu dois compléter ce champ';
//                     }
//                     return null;
//                   },
//                 ),
//               ),

//               // 📌 Champ Nom Speaker
//               Container(
//                 margin: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   controller: speakerNameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Nom Speaker',
//                     hintText: 'Entrer le nom du speaker',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Tu dois compléter ce champ';
//                     }
//                     return null;
//                   },
//                 ),
//               ),

//               // 📌 Dropdown (type de conférence)
//               Container(
//                 margin: const EdgeInsets.only(bottom: 10),
//                 child: DropdownButtonFormField<String>(
//                   value: selectedConftype, // ✅ valeur actuelle
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   items: const [
//                     DropdownMenuItem(
//                       value: 'Talk',
//                       child: Text('Talk show'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'demo',
//                       child: Text('Demo code'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'partner',
//                       child: Text('Partner'),
//                     ),
//                   ],
//                   onChanged: (value) {
//                     // ⚠️ value peut être null → on force avec !
//                     setState(() {
//                       selectedConftype = value!;
//                     });
//                   },
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // 📌 Bouton Envoyer
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // ✅ Validation du formulaire
//                     if (_formKey.currentState!.validate()) {
//                       final confName = confNameController.text;
//                       final speakerName = speakerNameController.text;

//                       // 📌 Message visuel
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Envoi en cours...')),
//                       );

//                       // 📌 Fermer le clavier
//                       FocusScope.of(context).unfocus();

//                       // 📌 Affichage console
//                       print(
//                           'Conférence: $confName, Speaker: $speakerName, Type: $selectedConftype');
//                     }
//                   },
//                   child: const Text('Envoyer'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     drawer:
//     Drawer(
//       child: ListView(
//         children: <Widget>[
//           Container(
//             color: Colors.amber[600],
//             height: 50,
//             child: const Center(child: Icon(Icons.add)),
//           ),
//           Container(
//             color: Colors.amber[500],
//             height: 50,
//             child: const Center(child: Text('Entry B')),
//           ),
//         ],
//       ),
//     );
//   }
// }
