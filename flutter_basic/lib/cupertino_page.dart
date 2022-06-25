import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPage extends StatefulWidget {
  const CupertinoPage({Key? key}) : super(key: key);

  @override
  State<CupertinoPage> createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  bool _switch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Cupertino UI'),
      ),
      body: Column(children: <Widget>[
        CupertinoButton(
          child: Text("Cupertino Button"),
          onPressed: () {
            print("Cupertino Button Pressed");
          },
        ),
        CupertinoSwitch(
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            }),
        RaisedButton(
          child: Text("Raised Button"),
          onPressed: () {
            print("Raised Button Pressed");
          },
        ),
        Switch(
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            }),
      ]),
    );
  }
}
