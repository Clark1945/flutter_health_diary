import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";

void main() {
  runApp(
      MaterialApp(
        home: weight(),
      )
  );
}

class weight extends StatefulWidget {
  const weight({Key? key}) : super(key: key);

  @override
  _weightState createState() => _weightState();
}

class _weightState extends State<weight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("體重"),
      ),
      body: Container(),
    );
  }
}

