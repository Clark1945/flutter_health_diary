import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import 'package:health1/sub_karory.dart';
import 'package:hive/hive.dart';
import 'sub_karory.dart';

void main() {
  runApp(MaterialApp(
    home: karory(),
  ));
}

class karory extends StatefulWidget {
  const karory({Key? key}) : super(key: key);

  @override
  karoryState createState() => karoryState();
}

class karoryState extends State<karory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("運動"),
      ),
      body: ListView(
        children: [
          Row(children: [
            Expanded(
                child: InkWell(
              child: Container(
                color: Colors.blue,
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                alignment: Alignment.topCenter,
                child: Text(
                  "走路",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => walk()));
              },
            )),
            Expanded(
              child: InkWell(
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  child: Text(
                    "高爾夫",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => golf()));
                },
              ),
            ),
            Expanded(
                child: InkWell(
              child: Container(
                color: Colors.blue,
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                alignment: Alignment.topCenter,
                child: Text(
                  "保齡球",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => bowling()));
              },
            ))
          ]),
          Row(children: [
            Expanded(
              child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "快走",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => speed_walking()));
                },
              ),
            ),
            Expanded(
                child: InkWell(
              child: Container(
                color: Colors.blue,
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                alignment: Alignment.topCenter,
                child: Text(
                  "划船",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => row()));
              },
            )),
            Expanded(
                child: InkWell(
              child: Container(
                color: Colors.blue,
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                alignment: Alignment.topCenter,
                child: Text(
                  "跳舞",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => dance()));
              },
            ))
          ]),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "羽毛球",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => badminton()));
                },
              )),
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "排球",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => volleyball()));
                },
              )),
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "乒乓球",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ping_pong()));
                },
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "網球",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => tennis()));
                },
              )),
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "直排輪",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => skate()));
                },
              )),
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "跳繩",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => rope()));
                },
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  child: Text(
                    "慢跑",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => jogging()));
                },
              )),
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "拳擊",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => boxing()));
                },
              )),
              Expanded(
                  child: InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 45),
                  alignment: Alignment.center,
                  child: Text(
                    "游泳",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => breaststroke()));
                },
              )),
              // TextButton(onPressed: gettotl(), child: Text("HI")),
            ],
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
