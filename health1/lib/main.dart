import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import "dart:developer";

import 'ex_time.dart';
import 'health_score.dart';
import 'karory.dart';
import 'muscle.dart';
import 'weigh.dart';
import 'stepcount.dart';
import 'sleeptime.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');

  runApp(
      MaterialApp(
      home: preface(),
      )
  );
}
final name = TextEditingController();
final sex = TextEditingController();
final age = TextEditingController();
final height = TextEditingController();
final weighs = TextEditingController();

class  preface extends StatelessWidget {
  preface({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
            title: Text("請先填入以下資料"),

            actions: [
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));},
                tooltip: "提交",
              ),
            ]
        ),
        body: ListView(
          children: <Widget>[
            TextField(
              controller: name,
              decoration: new InputDecoration(
                  icon: Icon(Icons.assignment_ind_outlined),
                  labelText: "姓名",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的姓名"
              ),
            ),
            TextField(
              controller: sex,
              decoration: new InputDecoration(
                  icon: Icon(Icons.assignment_ind_outlined),
                  labelText: "性別",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的性別"
              ),
            ),
            TextField(
              controller: age,
              decoration: new InputDecoration(
                  icon: Icon(Icons.assignment_ind_outlined),
                  labelText: "年齡",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的年齡"
              ),
            ),
            TextField(
              controller: height,
              decoration: new InputDecoration(
                  icon: Icon(Icons.assignment_ind_outlined),
                  labelText: "身高",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的身高"
              ),
            ),
            TextField(
              controller: weighs,
              decoration: new InputDecoration(
                  icon: Icon(Icons.assignment_ind_outlined),
                  labelText: "體重",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的體重"
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            //padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/UserIcon.png",
                      width: 100,
                      height: 100,
                    ),
                    Text(name.text),
                  ],
                ),

              ),
              ListTile(
                title: Text('性別：${sex.text} '),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('年齡：${age.text} 歲'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('身高：${height.text} 公斤'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('體重：${weighs.text} 公斤'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('身體質量指數(BMI)：'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: new AppBar(
          title: Text("健康日誌"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.miscellaneous_services),
              onPressed: (){
              },
              tooltip: "各項設定(暫定)",
            ),
            IconButton(
              icon: const Icon(Icons.perm_identity),
              onPressed: (){

              },
              tooltip: "查看個人資訊(暫定)",
            ),

          ],
        ),
        body: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: (){
                  },
                  child: Container(
                   child: ElevatedButton(child: Text('體重'),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => weight()));},
                     style: TextButton.styleFrom(primary: Colors.black,backgroundColor: Colors.grey),),
                    margin: EdgeInsets.fromLTRB(50, 5, 50,5),
                    //左右的Margin縮排設定
                  ),
                ),
                Container(
                  child: ElevatedButton(child: Text('睡眠時間'),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => sleeptime()));},
                    style: TextButton.styleFrom(primary: Colors.black,backgroundColor: Colors.grey),),
                  margin: EdgeInsets.fromLTRB(50, 5, 50,5),
                ),
                Container(
                  child: ElevatedButton(child: Text('步伐數量'),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => stepcount()));},
                    style: TextButton.styleFrom(primary: Colors.black,backgroundColor: Colors.grey),),
                  margin: EdgeInsets.fromLTRB(50, 5, 50,5),
                ),
                Container(
                  child: ElevatedButton(child: Text('運動時間及卡路里消耗'),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => karory()));},
                    style: TextButton.styleFrom(primary: Colors.black,backgroundColor: Colors.grey),),
                  margin: EdgeInsets.fromLTRB(50, 5, 50,5),
                ),
                Container(
                  child: ElevatedButton(child: Text('肌力測試'),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => muscle()));},
                    style: TextButton.styleFrom(primary: Colors.black,backgroundColor: Colors.grey),),
                  margin: EdgeInsets.fromLTRB(50, 5, 50,5),
                ),
                Container(
                  child: ElevatedButton(child: Text('健康分數評核'),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => health_score()));},
                    style: TextButton.styleFrom(primary: Colors.black,backgroundColor: Colors.grey,),),
                  margin: EdgeInsets.fromLTRB(50, 5, 50,5),
                ),
              ],
            )
        ),
      ),
    );
  }
}


