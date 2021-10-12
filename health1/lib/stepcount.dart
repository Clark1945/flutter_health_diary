import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";

void main() {
  runApp(
      MaterialApp(
        home: stepcount(),
      )
  );
}
class stepcount extends StatefulWidget {
  const stepcount({Key? key}) : super(key: key);

  @override
  _stepcountState createState() => _stepcountState();
}

class _stepcountState extends State<stepcount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("步伐計算"),
      ),
      body: Container(),
    );;
  }
}
