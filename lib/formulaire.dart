import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({Key? key}) : super(key: key);

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  String titre = "Formulaire";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Form(
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
                validator: (value) => value!.length < 3 || value.trim().isEmpty
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
                    return value!.length < 6 || value.trim().isEmpty
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
                validator: (value) => value!.trim().isEmpty
                    ? "Password can't be empty."
                    : value.length < 8
                        ? 'Password too short.'
                        : null,
              ),
              DropdownButton<String>(
                value: 'One',
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    // dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _nameController.text = "";
                      _emailController.text = "";
                      _passwordController.text = "";
                    });
                  }
                },
                child: const Text("Validate"),
              )
            ],
          ),
        ),
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
