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

void main() async {
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
  int todaySteps = 0;
  final stepcount_num = TextEditingController();
  int percent_step = 0;
  String ossas = "10000";
  String judge = "";

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

  void startListening() {
    //獲取計步器數值
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 5),
              child: Image.asset(
                'assets/walk.png',
                height: 25,
              ),
            ),
            Container(padding: const EdgeInsets.all(8.0), child: Text('步數'))
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '目標步數',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: stepcount_num,
                    decoration: new InputDecoration(labelText: "請輸入目標步數"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.flag),
                    label: Text("設立目標"),
                    onPressed: () {
                      stepcomplete();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(20, 10, 20, 10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.black26)),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '步數',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  // alignment: TextAlign.left,
                  child: Text(
                    '今日步數：${todaySteps.toString()} 步',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "完成進度：$todaySteps / $ossas",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                // Divider(),
                // Text(judge, style: TextStyle(fontSize: 30)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<int> getTodaySteps(int value) async {
    print(value); //步數
    int savedStepsCountKey = 999999;
    int? savedStepsCount =
        stepsBox.get(savedStepsCountKey, defaultValue: 0); //保存前幾天的步數

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
    if (todaySteps >= int.parse(ossas)) {
      judge = "恭喜達成目標！";
    }
    stepsBox.put(todayDayNo, todaySteps);
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription.cancel();
  }
}
