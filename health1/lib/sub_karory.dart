import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bicycle extends StatefulWidget {
  const bicycle({Key? key}) : super(key: key);

  @override
  _bicycleState createState() => _bicycleState();
}

class _bicycleState extends State<bicycle> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 5 == 0){
        setState(() {
          consume = consume +  1.96 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("腳踏車",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),

          ],
        ),
      ),
    );
  }
}


class walk extends StatefulWidget {
  const walk({Key? key}) : super(key: key);

  @override
  _walkState createState() => _walkState();
}

class _walkState extends State<walk> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(122.5大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.225 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("走路",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}


class golf extends StatefulWidget {
  const golf({Key? key}) : super(key: key);

  @override
  _golfState createState() => _golfState();
}

class _golfState extends State<golf> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，(129.5)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.295 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("高爾夫",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),

          ],
        ),
      ),
    );
  }
}


class bowling extends StatefulWidget {
  const bowling({Key? key}) : super(key: key);

  @override
  _bowlingState createState() => _bowlingState();
}

class _bowlingState extends State<bowling> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.295 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("保齡球",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 卡", style: TextStyle(fontSize: 32),),
            ),

          ],
        ),
      ),
    );
  }
}


class speed_walking extends StatefulWidget {
  const speed_walking({Key? key}) : super(key: key);

  @override
  _speed_walkingState createState() => _speed_walkingState();
}

class _speed_walkingState extends State<speed_walking> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.925 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("快走",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}



class row extends StatefulWidget {
  const row({Key? key}) : super(key: key);

  @override
  _rowState createState() => _rowState();
}

class _rowState extends State<row> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.19 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("划船",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}


class dance extends StatefulWidget {
  const dance({Key? key}) : super(key: key);

  @override
  _danceState createState() => _danceState();
}

class _danceState extends State<dance> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  2.38 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("跳舞",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}



class badminton extends StatefulWidget {
  const badminton({Key? key}) : super(key: key);

  @override
  _badmintonState createState() => _badmintonState();
}

class _badmintonState extends State<badminton> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.788 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("羽毛球",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}



class volleyball extends StatefulWidget {
  const volleyball({Key? key}) : super(key: key);

  @override
  _volleyballState createState() => _volleyballState();
}

class _volleyballState extends State<volleyball> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.26 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("排球",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}



class ping_pong extends StatefulWidget {
  const ping_pong({Key? key}) : super(key: key);

  @override
  _ping_pongState createState() => _ping_pongState();
}

class _ping_pongState extends State<ping_pong> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.47 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("乒乓球",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}



class tennis extends StatefulWidget {
  const tennis({Key? key}) : super(key: key);

  @override
  _tennisState createState() => _tennisState();
}

class _tennisState extends State<tennis> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 5 == 0){
        setState(() {
          consume = consume +  2.695 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("網球",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}




class skate extends StatefulWidget {
  const skate({Key? key}) : super(key: key);

  @override
  _skateState createState() => _skateState();
}

class _skateState extends State<skate> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  1.785 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("直排輪",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}




class rope extends StatefulWidget {
  const rope({Key? key}) : super(key: key);

  @override
  _ropeState createState() => _ropeState();
}

class _ropeState extends State<rope> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  2.94 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("跳繩",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}




class jogging extends StatefulWidget {
  const jogging({Key? key}) : super(key: key);

  @override
  _joggingState createState() => _joggingState();
}

class _joggingState extends State<jogging> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  2.87 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("慢跑",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}


class boxing extends StatefulWidget {
  const boxing({Key? key}) : super(key: key);

  @override
  _boxingState createState() => _boxingState();
}

class _boxingState extends State<boxing> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  3.99 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("拳擊",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}


class breaststroke extends StatefulWidget {
  const breaststroke({Key? key}) : super(key: key);

  @override
  _breaststrokeState createState() => _breaststrokeState();
}

class _breaststrokeState extends State<breaststroke> {

  int _counter = 0;
  bool _start = false;
  double consume = 0;

  @override
  void initState() {
    super.initState();
  }
  getCount(){
    if (_start){
      _start = false;
    }
    else{
      _start = true;

    }
    Timer.periodic(Duration(seconds:1), (timer){
      if (_start){
        setState(() {
          _counter ++;
        });
      }
      else{
        timer.cancel();
      }

      //以一名成年人70公斤，以20公里/小時的時速進行(294大卡)詳見 https://health.tainan.gov.tw/warehouse/%7B8961CCB1-809E-44E1-8602-AB6B4A9A2D87%7D/20160908142017_%E8%87%AA%E8%A1%8C%E8%BB%8A%E9%81%93%E7%86%B1%E9%87%8F%E6%A8%99%E7%A4%BA%E7%89%8C.pdf  /
      if (_counter % 18 == 0){
        setState(() {
          consume = consume +  2.205 ;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("運動時間及卡路里消耗"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("你選擇了",style: TextStyle(fontSize: 30,),),
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 5),
            ),
            Container(
              child: Text("游泳",style: TextStyle(fontSize: 70),),
            ),
            IconButton(onPressed: getCount, icon: Icon(Icons.play_circle_fill),iconSize: 100,),
            Container(
              child: Text("經過時間：$_counter 秒", style: TextStyle(fontSize: 32),),
            ),
            Container(
              child: Text("消耗卡路里：$consume 大卡", style: TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
    );
  }
}