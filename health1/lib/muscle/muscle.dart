import 'dart:async';
import 'dart:math';
import 'package:sensors/sensors.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'DataPage.dart';
import 'Use_Explain.dart';
// import '../test/ProfilePage.dart';
import 'CustomPage.dart';
import 'TestPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> strength_test() async {
  runApp(MaterialApp(home: Muscle_test()));
}

class Muscle_test extends StatefulWidget {
  @override
  _Muscle_testState createState() => _Muscle_testState();
}

class _Muscle_testState extends State<Muscle_test> {
  int _selectedIndex = 1;
  final pages = [DataPage(), HomePage(), CustomPage()];
  // final pages = [DataPage(), HomePage(), CustomPage(), TestPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                right: 10.0,
              ),
              child: Image.asset(
                'assets/muscle.png',
                height: 25,
              ),
            ),
            Container(padding: const EdgeInsets.all(8.0), child: Text('肌肉'))
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => explain()),
              );
            },
          ),
        ],
      ),
      body: pages[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: '結果',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reorder),
            label: '自訂',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: '測試',
          // ),
        ],
        backgroundColor: Colors.white,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        //目前選擇頁索引值
        // fixedColor: Colors.black, //選擇頁顏色
        onTap: _onItemClick, //BottomNavigationBar 按下處理事件
      ),
    );
  }

  void _onItemClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
