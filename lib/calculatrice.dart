import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({Key? key}) : super(key: key);

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  final TextEditingController _calcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculatrice"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: _calcController,
              textAlign: TextAlign.end,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(children: [
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "7";
                        },
                        child: const Text("7"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "4";
                        },
                        child: const Text("4"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "1";
                        },
                        child: const Text("1"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "-";
                        },
                        child: const Text("-"),
                      ),
                    ),
                  ),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Column(children: [
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "8";
                        },
                        child: const Text("8"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "5";
                        },
                        child: const Text("5"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "2";
                        },
                        child: const Text("2"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "+";
                        },
                        child: const Text("+"),
                      ),
                    ),
                  ),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Column(children: [
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "9";
                        },
                        child: const Text("9"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "6";
                        },
                        child: const Text("6"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _calcController.text += "3";
                        },
                        child: const Text("3"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                    height: 105,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          int total = 0;
                          List<String> numbers = [];
                          List<String> symbols = [];
                          String number = "";
                          for (var i = 0;
                              i < _calcController.text.length;
                              i++) {
                            if (i + 1 == _calcController.text.length &&
                                _calcController.text[i] != "+" &&
                                _calcController.text[i] != "-") {
                              number += _calcController.text[i];
                              numbers.add(number);
                              number = "";
                            } else if (_calcController.text[i] != "+" &&
                                _calcController.text[i] != "-") {
                              number += _calcController.text[i];
                            } else {
                              numbers.add(number);
                              number = "";
                              symbols.add(_calcController.text[i]);
                            }
                          }
                          print(numbers);
                          print(symbols);
                          total = int.parse(numbers[0]);
                          for (var j = 0; j < numbers.length; j++) {
                            if (j < symbols.length && symbols[j] == "+") {
                              total += int.parse(numbers[j + 1]);
                            } else if (j < symbols.length &&
                                symbols[j] == "-") {
                              total -= int.parse(numbers[j + 1]);
                            }
                          }
                          setState(() {
                            _calcController.text = total.toString();
                          });
                        },
                        child: const Text("="),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
