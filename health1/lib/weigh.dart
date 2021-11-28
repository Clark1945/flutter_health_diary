import 'dart:io';
import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import 'package:health1/sub_karory.dart';
import 'package:hive/hive.dart';
import "package:syncfusion_flutter_charts/charts.dart";
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:health1/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter DateTimePicker Demo',
        home: weight(),
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale.fromSubtags(languageCode: 'zh'), // generic Chinese 'zh'
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hans'), // generic simplified Chinese 'zh_Hans'
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hant'), // generic traditional Chinese 'zh_Hant'
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hans',
              countryCode: 'CN'), // 'zh_Hans_CN'
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hant',
              countryCode: 'TW'), // 'zh_Hant_TW'
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hant',
              countryCode: 'HK'), // 'zh_Hant_HK'], //, Locale('pt', 'BR')],
        ]);
  }
}

class weight extends StatefulWidget {
  //加入Provider
  weight({Key? key}) : super(key: key);
  @override
  weightState createState() => weightState();
}

class weightState extends State<weight> {
  Box<String> weight_box = Hive.box('alldata');
  final List<String> names = <String>[]; //預先加入的資料集
  TextEditingController nameController = TextEditingController(); //擷取文字用
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _controller3;
  late List<Person> _chartData;
  late TooltipBehavior _tooltipBehavior;
  // late

  @override
  void initState() {
    super.initState();
    _controller3 = TextEditingController(text: DateTime.now().toString());
    setState(() {
      _chartData = getChartData();
    });
    _tooltipBehavior = TooltipBehavior(enable: true);
    // _getValue();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {});
    }); //並沒有實際功能
  }

  void addItemToList() {
    DateTime realdatetime = DateTime.parse(_controller3.text);
    double realweight = double.parse(nameController.text);
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String select_day = dateFormat.format(realdatetime);
    //weight_box.clear();
    if (weight_box.keys.contains(select_day)) {
      print("錯誤");
    } else {
      setState(() {
        names.insert(0, nameController.text);
//      msgCount.insert(0, 0); //insert在0的位置加入0
        _chartData.insert(_chartData.length,
            Person(select_day, realweight.toString())); //圖表更新
      });
      weight_box.put(select_day, realweight.toString());
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
                  'assets/weight.png',
                  height: 25,
                ),
              ),
              Container(padding: const EdgeInsets.all(8.0), child: Text('體重'))
            ],
          ),
        ),
        body: ListView(
            // padding: EdgeInsets.all(10),
            children: <Widget>[
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
                  // BoxDecoration(border: Border.all(color: black)),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '新增體重',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '日期： ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.all(10),
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
                                      // icon: Icon(Icons.event),
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
                        ],
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '體重：',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              //用來設置Padding用的Widget
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black26),
                                  ),
                                  border: OutlineInputBorder(), //外框線
                                  labelText: '輸入您的體重', //Label
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.add),
                            label: Text(
                              ' 新增',
                            ),
                            onPressed: () {
                              addItemToList();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              elevation: MaterialStateProperty.all(0),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.black26)),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(25, 10, 25, 5),
                        ),
                        Container(
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.delete),
                            label: Text(
                              ' 刪除',
                            ),
                            onPressed: () {
                              setState(() {
                                weight_box.clear();
                                _chartData = [];
                              });
                              print(weight_box.keys);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              elevation: MaterialStateProperty.all(0),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.fromLTRB(20, 10, 20, 10)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                    text: "體重紀錄日誌",
                  ),
                  legend: Legend(isVisible: false), //顯示下面標籤
                  tooltipBehavior: _tooltipBehavior,
                  series: <ChartSeries>[
                    LineSeries<Person, String>(
                        // name: '體重', //改變標籤名稱
                        dataSource: _chartData,
                        xValueMapper: (Person sales, _) => sales.years, //X軸的資料
                        yValueMapper: (Person sales, _) =>
                            double.parse(sales.kgwieghts), //Y軸的資料
                        dataLabelSettings:
                            DataLabelSettings(isVisible: false), //取消在圖表上顯示
                        enableTooltip: true //final enable tooltip
                        )
                  ],
                  primaryXAxis: CategoryAxis(), //設定X軸為DateTime格式
                  primaryYAxis: NumericAxis(
                    //設定Y軸為數字格式
                    labelFormat: '{value} kg',
                    //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0) //$設定US為Default
                  ),
                ),
              ),
            ]));
  }

  List<Person> getChartData() {
    final List<Person> chartData = [];
    for (var key in weight_box.keys) {
      chartData.insert(0, Person(key, weight_box.get(key).toString()));
    }
    return chartData;
  }
}

class weightData {
  weightData(this.year, this.kgwieght);
  final DateTime year;
  final double kgwieght;
}
