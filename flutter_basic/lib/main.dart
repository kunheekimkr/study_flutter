import 'package:flutter/material.dart';
import 'cupertino_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
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
          primarySwatch: Colors.blue,
        ),
        home: HelloPage('Hello World'));
    //home: CupertinoPage());
  }
}

class HelloPage extends StatefulWidget {
  final String title;
  HelloPage(this.title);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: _incrementCounter),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Count', style: TextStyle(fontSize: 30)),
            Text('$_counter', style: TextStyle(fontSize: 30)),
            RaisedButton(
              child: const Text('Change Screen'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CupertinoPage()));
              },
            )
          ],
        )));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
