import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";

void main() {
  runApp(
      MaterialApp(
        home: muscle(),
      )
  );
}

class muscle extends StatefulWidget {
  const muscle({Key? key}) : super(key: key);

  @override
  _muscleState createState() => _muscleState();
}

class _muscleState extends State<muscle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("肌力測試"),
      ),
      body: Container(),
    );
  }
}
