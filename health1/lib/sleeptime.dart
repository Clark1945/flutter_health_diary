import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import 'package:direct_select/direct_select.dart';
import 'package:hive/hive.dart';
import "package:syncfusion_flutter_charts/charts.dart";
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

import 'main.dart';

void main() {
  runApp(MaterialApp(
    home: sleeptime(),
  ));
}

class sleeptime extends StatefulWidget {
  const sleeptime({Key key}) : super(key: key);

  @override
  sleeptimeState createState() => sleeptimeState();
}

class sleeptimeState extends State<sleeptime> {
  List<Person> _chartData;
   TooltipBehavior _tooltipBehavior;
   TextEditingController _controller3;
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  int selectedIndex1 = 0;
  String St = "";
  Box<String> sleeptime_box = Hive.box('alldata');

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);

    super.initState();
    _controller3 = TextEditingController(text: DateTime.now().toString());
  }

  final elements1 = [
    "1 小時",
    "2 小時",
    "3 小時",
    "4 小時",
    "5 小時",
    "6 小時",
    "7 小時",
    "8 小時",
    "9 小時",
    "10 小時以上",
  ];

  List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  void addItemToList(String str) {
    var datetime = DateTime.parse(_controller3.text);
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String select_day = dateFormat.format(datetime);

    String sleeptime = str.substring(0, 1);
    double realweight = double.parse(sleeptime);
    if (sleeptime_box.containsKey(select_day)) {
    } else {
      setState(() {
        var Date = DateTime.now();
        int Datemon = Date.day; //加入月份
        //names.insert(0,nameController.text);
//      msgCount.insert(0, 0); //insert在0的位置加入0
        _chartData.insert(_chartData.length,
            Person(select_day, realweight.toString())); //圖表更新
      });
      sleeptime_box.put(select_day, sleeptime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 5),
              child: Image.asset(
                'assets/sleep.png',
                height: 25,
              ),
            ),
            Container(padding: const EdgeInsets.all(8.0), child: Text('睡眠'))
          ],
        ),
      ),
      body: ListView(children: <Widget>[
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
                  '新增睡眠時間',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Form(
                    key: _oFormKey,
                    child: Column(
                      children: <Widget>[
                        DateTimePicker(
                          type: DateTimePickerType.date, //顯示格式
                          dateMask: 'Md', //需求資料格式
                          controller: _controller3, //
                          //initialValue: _initialValue,
                          firstDate: DateTime(2000), //範圍
                          lastDate: DateTime(2100), //範圍
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          //locale: Locale('pt', 'BR'),
                          selectableDayPredicate: (date) {
                            return true;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "睡眠時間：",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DirectSelect(
                      itemExtent: 70.0,
                      selectedIndex: selectedIndex1,
                      child: Container(
                        width: 150,
                        child: MySelectionItem(
                          isForList: false,
                          title: elements1[selectedIndex1],
                        ),
                      ),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedIndex1 = index;
                          St = elements1[selectedIndex1];
                          addItemToList(St);
                        });
                      },
                      mode: DirectSelectMode.tap,
                      items: _buildItems1(),
                    ),
                  ],
                ),
              ),
              Container(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text(
                    ' 刪除',
                  ),
                  onPressed: () {
                    setState(() {
                      sleeptime_box.clear();
                      _chartData = [];
                    });
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
                padding: EdgeInsets.fromLTRB(25, 10, 25, 5),
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
          child: SfCartesianChart(
            title: ChartTitle(
              text: "睡眠時間",
            ),
            legend: Legend(isVisible: false), //顯示下面標籤
            tooltipBehavior: _tooltipBehavior,
            series: <ChartSeries>[
              ColumnSeries<Person, String>(
                  //name: '睡眠時間',  //改變標籤名稱
                  dataSource: _chartData,
                  xValueMapper: (Person sales, _) => sales.years, //X軸的資料
                  yValueMapper: (Person sales, _) =>
                      double.parse(sales.kgwieghts), //Y軸的資料
                  dataLabelSettings: DataLabelSettings(isVisible: false),
                  enableTooltip: true //final enable tooltip
                  )
            ],
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              labelFormat: '{value}小時',
              //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0) //$設定US為Default
            ),
          ),
        ),
      ]),
    );
  }

  List<Person> getChartData() {
    final List<Person> chartData = [];
    for (var key in sleeptime_box.keys) {
      chartData.insert(0, Person(key, sleeptime_box.get(key).toString()));
    }
    List<Person> rechart = new List(chartData.length);
    for(var i=0;i<chartData.length;i++){
      rechart[i] = chartData[rechart.length-1-i];
    }
    return rechart;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;
  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      alignment: Alignment.center,
      child: FittedBox(
          child: Text(
        title,
        style: TextStyle(fontSize: 16),
      )),
    );
  }
}
