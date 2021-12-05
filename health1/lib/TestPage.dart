import 'package:flutter/material.dart';
import 'dart:async';

class TestPage extends StatefulWidget {
  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Center(
        // padding: EdgeInsets.all(15.0),
        child: ElevatedButton(
          // padding: EdgeInsets.all(15),
          child: Text(
            'test',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () => print('123'),
        ),
      ),
    );
  }
}
