import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'health_score.dart';
import 'karory.dart';
import 'muscle.dart';
import 'weigh.dart';
import 'stepcount.dart';
import 'sleeptime.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');
  await Hive.openBox<String>("alldata");
  runApp(MaterialApp(
    home: preface(),
  ));
}

TextEditingController name = TextEditingController();
TextEditingController sex = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController height = TextEditingController();
TextEditingController weighs = TextEditingController();
double BMI = 0;
String Status = "";

class preface extends StatefulWidget {
  const preface({Key? key}) : super(key: key);
  @override
  _prefaceState createState() => _prefaceState();
}

class _prefaceState extends State<preface> {
  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<weight>(context); //應用底層
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text("請先填入以下資料"),
          actions: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                if (age.text == "" ||
                    name.text == "" ||
                    sex.text == "" ||
                    height.text == "" ||
                    weighs.text == "") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                  // print("未輸入完全");
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Msgbox()));
                } else {
                  BMI = (double.parse(weighs.text)) /
                      ((double.parse(height.text) / 100) *
                          (double.parse(height.text) / 100));
                  if (BMI > 24) {
                    Status = "過重";
                  } else if (BMI < 18.5) {
                    Status = "過輕";
                  } else {
                    Status = "正常";
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                }
              },
              tooltip: "提交",
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          children: <Widget>[
            TextField(
              controller: name,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  icon: Icon(Icons.person),
                  labelText: "姓名",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的姓名"),
            ),
            TextField(
              controller: sex,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  icon: Icon(Icons.female),
                  labelText: "性別",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的性別"),
            ),
            TextField(
              controller: age,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  icon: Icon(Icons.forward_10),
                  labelText: "年齡",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的年齡"),
            ),
            TextField(
              controller: height,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  icon: Icon(Icons.height),
                  labelText: "身高",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的身高"),
            ),
            TextField(
              controller: weighs,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  icon: Icon(Icons.monitor_weight),
                  labelText: "體重",
                  suffix: Icon(Icons.close),
                  hintText: "請輸入您的體重"),
            ),
          ],
        ),
      ),
    );
  }
}

@HiveType(typeId: 1)
class Person {
  Person(this.years, this.kgwieghts);
  @HiveField(0)
  late String years;
  @HiveField(1)
  late String kgwieghts;
}

class Msgbox extends StatelessWidget {
  const Msgbox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('錯誤'),
      content: const Text('資料未輸入完全'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    final devicewidth = devicesize.width;
    final deviceheight = devicesize.height;
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
                onTap: () {},
              ),
              ListTile(
                title: Text('年齡：${age.text} 歲'),
                onTap: () {},
              ),
              ListTile(
                title: Text('身高：${height.text} 公斤'),
                onTap: () {},
              ),
              ListTile(
                title: Text('體重：${weighs.text} 公斤'),
                onTap: () {},
              ),
              ListTile(
                title: Text('BMI：${BMI.toStringAsFixed(2)}'),
                onTap: () {},
              ),
              ListTile(
                title: Text('狀態顯示：${Status}'),
                onTap: () {},
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: Text("健康日誌"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.miscellaneous_services),
              onPressed: () {},
              tooltip: "各項設定(暫定)",
            ),
            IconButton(
              icon: const Icon(Icons.perm_identity),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => preface()));
              },
              tooltip: "查看個人資訊(暫定)",
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.monitor_weight,
                  size: 24.0,
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '   體重',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '   記錄每日體重的變化',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => weight()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(30, 25, 30, 25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.black12)),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 25, 15, 5),
            ),
            Container(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.hotel,
                  size: 24.0,
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '   睡眠',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '   記錄每日睡眠的時間',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => sleeptime()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(30, 25, 30, 25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.black12)),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            ),
            Container(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.directions_walk,
                  size: 24.0,
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '   步數',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '   自動記錄每日走路步數',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => stepcount()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(30, 25, 30, 25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.black12)),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            ),
            Container(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.directions_run,
                  size: 24.0,
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '   運動',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '   記錄運動時間及卡路里消耗',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => karory()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(30, 25, 30, 25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.black12)),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            ),
            Container(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.fitness_center,
                  size: 24.0,
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '   肌力',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '   測量肌肉力量',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => muscle()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(30, 25, 30, 25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.black12)),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            ),
            Container(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.spa,
                  size: 24.0,
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '   健康分數',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '   綜合健康參考分數',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => health_score()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(30, 25, 30, 25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.black12)),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
            ),
          ],
        ),
      ),
    );
  }
}
