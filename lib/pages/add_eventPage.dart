import 'package:flutter/material.dart';

class AddEventpage extends StatefulWidget {
  const AddEventpage({super.key});

  @override
  State<AddEventpage> createState() => _AddEventpageState();
}

class _AddEventpageState extends State<AddEventpage> {
  //recuperation de chaque champ du formulaire et executer le validator
  final _formKey = GlobalKey<FormState>();

//pour recuperer les valeurs des champs du formulaire
  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConftype = 'Talk '; //pour stocker la valeur selectionnée dans le dropdown menu

  @override
  void dispose() {
        super.dispose();
        

    confNameController.dispose();
    speakerNameController.dispose();
  }

  Widget build(BuildContext context) {
    return  Padding(
    padding: EdgeInsets.all(16),
      child: Form(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom Confernce',
                  hintText: 'Entre le nom de la conference',
                ),
                //verifier que un champs est rempli
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'tu dois completter ce texte';
                  }
                  return null;
                },
                controller: confNameController,
              ),
            ),
             Container(
              margin: EdgeInsets.all(30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom Speaker',
                  hintText: 'Entre le nom du speaker',
                ),
                //verifier que un champs est rempli
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'tu dois completter ce texte';
                  }
                  return null;
                },
                controller: speakerNameController,
              ),
            ),
            // pour faire un dropdown menu pour choisir une donnée de la conference ou le type de la conference ou le type de la conference
           Container(
            margin: EdgeInsets.only(bottom: 10),
             child: DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Talk ', child: Text('Talk show')),
                DropdownMenuItem(value: 'demo ', child: Text('demo code')),
                DropdownMenuItem(value: 'partner', child: Text('partner')),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              //pour verifier que l'utilisateur a choisi une valeur dans le dropdown menu
              value: selectedConftype,
              onChanged: (value) {
                setState(() {
                  // Mettre à jour la valeur sélectionnée
                  selectedConftype = value;
                });
              },
             ),
           ) ,
           
            SizedBox(
              //pour occuper l'espace
              width: double.infinity,
              height: 60, //espace entre les deux elements field and button
              child: ElevatedButton(
                onPressed: () {

                  //verifier que le formulaire est valide avant de l'envoyer
                  if (_formKey.currentState!.validate()) {
                  final confName = confNameController.text;
                  final speakerName = speakerNameController.text; 
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Envoi en cours')),
                    );
                    //envoyer les données du formulaire vers le backend ou une base de données
                    //FocusScope.of(context).unfocus(); //pour fermer le clavier apres l'envoi du formulaire
                    FocusScope.of(context).requestFocus(FocusNode()); //pour fermer le clavier apres l'envoi du formulaire
                  print('Ajout de la cong $confName par le speaker $speakerName');
                  }
                },
                child: Text('Envoyer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
