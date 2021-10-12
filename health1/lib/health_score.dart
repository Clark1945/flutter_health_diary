import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";

void main() {
  runApp(
      MaterialApp(
        home: health_score(),
      )
  );
}

class health_score extends StatefulWidget {
  const health_score({Key? key}) : super(key: key);

  @override
  _health_scoreState createState() => _health_scoreState();
}

class _health_scoreState extends State<health_score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("健康分數"),
      ),
      body: Container(),
    );
  }
}

