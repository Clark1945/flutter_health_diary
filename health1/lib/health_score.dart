import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import 'package:health1/karory.dart';
import 'package:health1/sleeptime.dart';
import "dart:developer";

import 'package:health1/weigh.dart';
import 'package:hive/hive.dart';

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

  final GlobalKey<weightState> _weight_db = GlobalKey<weightState>();
  final GlobalKey<karoryState> _karory_db = GlobalKey<karoryState>();
  final GlobalKey<sleeptimeState> _sleeptime_db = GlobalKey<sleeptimeState>();
  late Box a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("健康分數"),
      ),
      body: ListView(children: [
        TextButton(onPressed: (){}, child: Text("笨蛋")),

      ],)
    );
  }
}

