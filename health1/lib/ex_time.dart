import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";

void main() {
  runApp(
      MaterialApp(
        home: execrise(),
      )
  );
}

class execrise extends StatefulWidget {
  const execrise({Key? key}) : super(key: key);

  @override
  _execriseState createState() => _execriseState();
}

class _execriseState extends State<execrise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間"),
      ),
      body: Container(),
    );
  }
}
