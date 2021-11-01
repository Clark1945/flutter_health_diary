import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";

import 'sub_karory.dart';

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
      appBar: AppBar(
        title: Text("選擇您的運動方式"),
      ),
      body: ListView(
        children: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("騎腳踏車",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => bicycle()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("走路",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => walk()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("高爾夫",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => golf()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("保齡球",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => bowling()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("快走",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => speed_walking()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("划船",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => row()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("跳舞",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => dance()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("羽毛球",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => badminton()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("排球",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => volleyball()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("乒乓球",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ping_pong()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("網球",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => tennis()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("直排輪",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => skate()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("跳繩",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => rope()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("慢跑",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => jogging()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("拳擊",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => boxing()));},
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text("游泳",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => breaststroke()));},
          ),
          Divider(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

