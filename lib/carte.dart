import 'package:flutter/material.dart';
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
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => true,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
