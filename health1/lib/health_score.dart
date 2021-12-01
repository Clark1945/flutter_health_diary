import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:health1/main.dart';
import 'package:path_provider/path_provider.dart';

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
  late String XY= "";
  late String status = "";
  Map valueMap= {};

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      //print(contents);
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "Null";
    }
  }
  @override
  void initState() {
    super.initState();
    String XX = readCounter().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("健康分數"),
        ),
        body: ListView(children: [
          TextButton(onPressed: (){
            readCounter().then((value) {
              XY = value;
              XY = XY.substring(0,XY.length-1);
              return XY;//從檔案中取得值
            });
            print(XY);
            XY=XY.replaceAll('{','');//去除字元殘留
            XY=XY.replaceAll("}", "");//去除字元殘留
            print(XY);
            final valueMap = json.decode("\{"+XY+"\}");
            double wei =0;
            for(var val in valueMap.keys){
              wei = wei + double.parse(valueMap[val]);
            }
            if ((wei/valueMap.keys.length-double.parse(weighs.text))>5){  //判斷條件(可改)
              setState(() {
                status = "增加過多，需多加留意";
              });
            }
            else if((wei/valueMap.keys.length-double.parse(weighs.text))<5){
              setState(() {
                status = "減少過多，需多加留意";
              });
            }
          }, child: Text("XX")),
          Text("體重狀態：${status}"),
        ],)
    );
  }

}