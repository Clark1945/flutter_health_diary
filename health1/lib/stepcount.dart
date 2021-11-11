

import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

void main() async{
  runApp(stepcount());
}
class stepcount extends StatefulWidget {

//  const stepcount({Key? key}) : super(key: key);
  @override
  _stepcountState createState() => _stepcountState();
}

class _stepcountState extends State<stepcount> {


  late Pedometer _pedometer;
  late StreamSubscription<int> _subscription;
  String _status = '?', _steps = '?';
  Box<int> stepsBox = Hive.box('steps');
  int todaySteps=0;
  final stepcount_num = TextEditingController();
  int percent_step = 0;
  String ossas = "?";
  String judge ="";

  @override
  void initState() {

    super.initState();
    startListening();
  }



  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void startListening() { //獲取計步器數值
    _pedometer = Pedometer();
    _subscription = _pedometer.pedometerStream.listen(
      getTodaySteps,
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    );
  }
  void _onDone() => print("Finished pedometer tracking");
  void _onError(error) => print("Flutter Pedometer Error: $error");

  void stepcomplete() {
    setState(() {
      ossas = stepcount_num.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Pedometer example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          TextField(
            controller: stepcount_num,
          decoration: new InputDecoration(labelText: "輸入本日目標"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ], // Only numbers can be entered
        ),
              Divider(),
              ElevatedButton(onPressed: () => stepcomplete(), child: Text("設立目標")
              ),
              Divider(),
              Text(
                '已完成步數',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                todaySteps.toString(),
                style: GoogleFonts.darkerGrotesque(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "完成進度：""$todaySteps""/""$ossas",
                style: TextStyle(fontSize: 30),
              ),
              Divider(),
              Text(judge,style: TextStyle(fontSize: 30)),

            ],
          ),
        ),
      ),
    );
  }
  Future<int> getTodaySteps(int value) async {
    print(value);  //步數
    int savedStepsCountKey = 999999;
    int? savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);  //保存前幾天的步數

    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;
    if (value < savedStepsCount!) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }

    // load the last day saved using a package of your choice here
    int lastDaySavedKey = 888888;
    int? lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);

    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.
    if (lastDaySaved! < todayDayNo) {
      lastDaySaved = todayDayNo;
      savedStepsCount = value;

      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }

    setState(() {
      todaySteps = value - savedStepsCount!;
    });
    stepsBox.put(todayDayNo, todaySteps);
    if (todaySteps.toString() == "Null") {
      todaySteps = 0;
    }
    if (todaySteps >= int.parse(ossas)){
      judge = "恭喜達成目標！";
    }
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription.cancel();
  }
}
