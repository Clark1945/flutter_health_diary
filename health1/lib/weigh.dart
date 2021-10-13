import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "package:syncfusion_flutter_charts/charts.dart";
import 'package:intl/intl.dart';
import "dart:developer";


void main() {
  runApp(
      MaterialApp(
        home: weight(),
      )
  );
}
class weight extends StatefulWidget {
  const weight({Key? key}) : super(key: key);

  @override
  _weightState createState() => _weightState();
}

class _weightState extends State<weight> {

  final List<String> names = <String>[];  //預先加入的資料集
  //final List<int> msgCount = <int>[2, 10];  //預先加入的資料集
  TextEditingController nameController = TextEditingController();//擷取文字用
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);
//      msgCount.insert(0, 0); //insert在0的位置加入0
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("體重紀錄"),
      ),
      body: Column(
          children: <Widget>[
            Padding(  //用來設置Padding用的Widget
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), //外框線
                  labelText: '輸入您的體重',  //Label
                ),
              ),
            ),
            RaisedButton(
              child: Text('加入'),
              onPressed: () {
                addItemToList(); //呼叫方法
              },
            ),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        margin: EdgeInsets.all(2),
                        color: Colors.blue,
                        //                        msgCount[index]>=10? Colors.blue[400]:
//                        msgCount[index]>3? Colors.blue[100]: Colors.grey,
                        child: Center(
                            child: Text('${names[index]} ',
                              style: TextStyle(fontSize: 18),
                            )
                        ),
                      );
                    }
                )
            ),
            SfCartesianChart(
              title: ChartTitle(text: "體重紀錄日誌",
              ),
              legend: Legend(isVisible: true), //顯示下面標籤
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[
                LineSeries<SalesData,double>(
                    name: 'Sales',  //改變標籤名稱
                    dataSource: _chartData,
                    xValueMapper: (SalesData sales, _) => sales.year,  //X軸的資料
                    yValueMapper: (SalesData sales, _) => sales.sales,  //Y軸的資料
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true  //final enable tooltip
                )
              ],
              primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
              primaryYAxis: NumericAxis(
                labelFormat: '{value}kg',
                //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0) //$設定US為Default
              ),
            ),
          ]
      )
    );
  }
  List<SalesData> getChartData(){
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 108),
      SalesData(2021, 30),
    ];
    return chartData;
  }
}

class SalesData{
  SalesData(this.year,this.sales);
  final double year;
  final double sales;
}