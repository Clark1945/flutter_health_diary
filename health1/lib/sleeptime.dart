import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";

void main() {
  runApp(
      MaterialApp(
        home: sleeptime(),
      )
  );
}
class sleeptime extends StatefulWidget {
  const sleeptime({Key? key}) : super(key: key);

  @override
  _sleeptimeState createState() => _sleeptimeState();
}

class _sleeptimeState extends State<sleeptime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("睡眠時間"),
      ),
      body: Container(),
    );;
  }
}