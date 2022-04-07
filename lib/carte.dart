import 'package:flutter/material.dart';
import 'package:flutter_april/formulaire.dart';
import 'package:flutter_april/helpers/function.dart';
import 'package:flutter_april/models/user_model.dart';

class Carte extends StatefulWidget {
  const Carte({Key? key}) : super(key: key);

  @override
  State<Carte> createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  List<User> users = [
    User("Sébastien", "123456", "seb@gmail.com"),
    User("Alex6", "1234567", "alexis@gmail.com"),
    User("Mourad", "12345678", "mourad@gmail.com"),
    User("Chtéphane", "123456789", "pacpac@gmail.com"),
    User("Sébastien", "123456", "seb@gmail.com"),
    User("Alex6", "1234567", "alexis@gmail.com"),
    User("Mourad", "12345678", "mourad@gmail.com"),
    User("Chtéphane", "123456789", "pacpac@gmail.com"),
    User("Sébastien", "123456", "seb@gmail.com"),
    User("Alex6", "1234567", "alexis@gmail.com"),
    User("Mourad", "12345678", "mourad@gmail.com"),
    User("Chtéphane", "123456789", "pacpac@gmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carte"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () => true,
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 45,
                    ),
                    title: Text(users[index].name),
                    subtitle: Text(users[index].email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            const ShowConfirmAlertDialog().show(
                              context,
                              "Modification",
                              const Text(
                                  "Êtes-vous sur de vouloir modifier cet utilisateur ?"),
                              "Modifier",
                              "Annuler",
                              () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Formulaire(),
                                  ),
                                );
                              },
                              () {
                                Navigator.pop(context);
                              },
                            );
                          },
                          color: Colors.blue,
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            const ShowConfirmAlertDialog().show(
                              context,
                              "Suppression",
                              const Text(
                                  "Êtes-vous sur de vouloir supprimer cet utilisateur ?"),
                              "Supprimer",
                              "Annuler",
                              () {
                                setState(() {
                                  users.removeAt(index);
                                });
                                Navigator.pop(context);
                              },
                              () {
                                Navigator.pop(context);
                              },
                            );
                          },
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
