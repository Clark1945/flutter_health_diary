import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
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
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pedometer example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Steps taken:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                todaySteps.toString(),
                style: GoogleFonts.darkerGrotesque(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              Text(
                'Pedestrian status:',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                    ? Icons.accessibility_new
                    : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
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
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription.cancel();
  }
}
