import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";

void main() {
  runApp(
      MaterialApp(
        home: karory(),
      )
  );
}
class karory extends StatefulWidget {
  const karory({Key? key}) : super(key: key);

  @override
  _karoryState createState() => _karoryState();
}

class _karoryState extends State<karory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("卡路里消耗"),
      ),
      body: Container(),
    );
  }
}

