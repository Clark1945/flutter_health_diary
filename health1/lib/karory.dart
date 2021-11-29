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
                'assets/sport.png',
                height: 25,
              ),
            ),
            Container(padding: const EdgeInsets.all(8.0), child: Text('運動'))
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "走路",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => walk()));
              },
            ),
            // Divider(color: Colors.black),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "高爾夫",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => golf()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "保齡球",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => bowling()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "快走",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => speed_walking()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "划船",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => row()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "跳舞",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => dance()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "羽毛球",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => badminton()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "排球",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => volleyball()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "乒乓球",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ping_pong()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "網球",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => tennis()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "直排輪",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => skate()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "跳繩",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => rope()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "慢跑",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => jogging()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "拳擊",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => boxing()));
              },
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "游泳",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => breaststroke()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
