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
                            String _name = "";
                            String _email = "";
                            String _password = "";

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
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: "Name",
                                          hintText: "Enter your name...",
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _name = value;
                                          });
                                        },
                                        validator: (value) =>
                                            value!.length < 3 ||
                                                    value.trim().isEmpty
                                                ? 'Name too short.'
                                                : null,
                                      ),
                                      TextFormField(
                                          decoration: const InputDecoration(
                                            icon: Icon(Icons.email),
                                            labelText: "Email",
                                            hintText: "Enter your email...",
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              _email = value;
                                            });
                                          },
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
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.lock),
                                          labelText: "Password",
                                          hintText: "Enter your password...",
                                        ),
                                        obscureText: true,
                                        onChanged: (value) {
                                          setState(() {
                                            _password = value;
                                          });
                                        },
                                        validator: (value) =>
                                            value!.trim().isEmpty
                                                ? "Password can't be empty."
                                                : value.length < 8
                                                    ? 'Password too short.'
                                                    : null,
                                      ),
                                      DropdownButton<String>(
                                        value: 'One',
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            // dropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'One',
                                          'Two',
                                          'Free',
                                          'Four'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _onBasicAlertPressed(context);
                                            _formKey.currentState!.setState(() {
                                              _name = "";
                                              _email = "";
                                              _password = "";
                                            });
                                          }
                                        },
                                        child: const Text("Validate"),
                                      )
                                    ],
                                  ),
                                );
                              }),
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
