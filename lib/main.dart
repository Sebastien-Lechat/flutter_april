import 'package:flutter/material.dart';
import 'package:flutter_april/calculatrice.dart';
import 'package:flutter_april/carte.dart';
import 'package:flutter_april/formulaire.dart';
// import 'package:flutter_april/formulaire.dart';
// import 'package:flutter_april/page2.dart';
// import 'package:flutter_april/page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter April App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Row(
                  children: const [
                    Expanded(
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        "Lechat S??bastien",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              leading: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: const Text("Profile"),
              leading: IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {},
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: const Text("Contact"),
              leading: IconButton(
                icon: const Icon(Icons.contact_page),
                onPressed: () {},
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: const TextSpan(
                  text: 'You have',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' pushed the button ',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationStyle: TextDecorationStyle.wavy,
                      ),
                    ),
                    TextSpan(
                      text: 'this many times:',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ]),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline3,
            ),
            // Image.asset("abc.jpg"),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Calculatrice(),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnLMRFv-RArj9MuYTnMKUwDb5jfw0wvBd4mw&usqp=CAU",
                      scale: 0.5),
                )),
            ElevatedButton.icon(
              onPressed: () => true,
              icon: const Icon(
                Icons.add_box,
                color: Colors.purple,
              ),
              label: const Text(
                'Appuyer',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(240, 60)),
                  padding: MaterialStateProperty.all(const EdgeInsets.only(
                      left: 25, right: 25, top: 7, bottom: 10)),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 25))),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.deepOrange,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
