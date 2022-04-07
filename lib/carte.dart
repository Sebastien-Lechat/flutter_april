import 'package:flutter/material.dart';
import 'package:flutter_april/formulaire.dart';
import 'package:flutter_april/helpers/function.dart';
import 'package:flutter_april/models/user_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
            itemBuilder: (ctx2, index) {
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
                            final TextEditingController _nameController =
                                TextEditingController(text: users[index].name);
                            final TextEditingController _emailController =
                                TextEditingController(text: users[index].email);
                            final TextEditingController _passwordController =
                                TextEditingController(
                                    text: users[index].password);

                            final _formKey = GlobalKey<FormState>();

                            const ShowConfirmAlertDialog().show(
                              context,
                              "Modification",
                              StatefulBuilder(builder: (ctx2, setBottom) {
                                return Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _nameController,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: "Name",
                                          hintText: "Enter your name...",
                                        ),
                                        validator: (value) =>
                                            value!.length < 3 ||
                                                    value.trim().isEmpty
                                                ? 'Name too short.'
                                                : null,
                                      ),
                                      TextFormField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            icon: Icon(Icons.email),
                                            labelText: "Email",
                                            hintText: "Enter your email...",
                                          ),
                                          validator: (value) {
                                            return value!.length < 6 ||
                                                    value.trim().isEmpty
                                                ? 'Email too short.'
                                                : !RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$')
                                                        .hasMatch(value)
                                                    ? 'Invalid email address.'
                                                    : null;
                                          }),
                                      TextFormField(
                                        controller: _passwordController,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.lock),
                                          labelText: "Password",
                                          hintText: "Enter your password...",
                                        ),
                                        obscureText: true,
                                        validator: (value) =>
                                            value!.trim().isEmpty
                                                ? "Password can't be empty."
                                                : value.length < 8
                                                    ? 'Password too short.'
                                                    : null,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              "Modifier",
                              "Annuler",
                              () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    users[index].name = _nameController.text;
                                    users[index].email = _emailController.text;
                                    users[index].password =
                                        _passwordController.text;
                                  });
                                  Navigator.pop(context);
                                }
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

_onBasicAlertPressed(context) {
  Alert(
    context: context,
    type: AlertType.success,
    title: "Succès",
    desc: "Le formulaire est correct !",
    buttons: [
      DialogButton(
        child: const Text(
          "Fermer",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}
