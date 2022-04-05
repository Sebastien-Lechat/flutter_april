import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
      ),
      body: Column(children: [
        Container(
          child: Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Retour"),
            ),
          ),
          margin: const EdgeInsets.all(15),
        ),
        Container(
          child: Align(
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnLMRFv-RArj9MuYTnMKUwDb5jfw0wvBd4mw&usqp=CAU",
                scale: 1.5),
            alignment: Alignment.bottomLeft,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Align(
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnLMRFv-RArj9MuYTnMKUwDb5jfw0wvBd4mw&usqp=CAU",
                      scale: 1),
                  alignment: Alignment.topRight,
                ),
                padding: const EdgeInsets.all(15),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: Align(
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnLMRFv-RArj9MuYTnMKUwDb5jfw0wvBd4mw&usqp=CAU",
                      scale: 1),
                  alignment: Alignment.bottomLeft,
                ),
                padding: const EdgeInsets.all(15),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 150,
              child: Container(
                child: Align(
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnLMRFv-RArj9MuYTnMKUwDb5jfw0wvBd4mw&usqp=CAU",
                      scale: 1),
                  alignment: Alignment.topRight,
                ),
                padding: const EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              width: 200,
              child: Container(
                child: Align(
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnLMRFv-RArj9MuYTnMKUwDb5jfw0wvBd4mw&usqp=CAU",
                      scale: 1),
                  alignment: Alignment.bottomLeft,
                ),
                padding: const EdgeInsets.all(15),
              ),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.green[500]),
            const Icon(Icons.star, color: Colors.black),
            const Icon(Icons.star, color: Colors.black),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
              ],
            )
          ],
        )
      ]),
    );
  }
}
