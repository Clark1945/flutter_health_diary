import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "dart:developer";
import 'package:direct_select/direct_select.dart';
import "package:syncfusion_flutter_charts/charts.dart";

void main() {
  runApp(
      MaterialApp(
        home: sleeptime(),
      )
  );
}
class sleeptime extends StatefulWidget {
  const sleeptime({Key? key}) : super(key: key);

  @override
  _sleeptimeState createState() => _sleeptimeState();
}

class _sleeptimeState extends State<sleeptime> {

  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
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

  int? selectedIndex1 = 0;
  int? St = 0;
  List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
      title: val,
    ))
        .toList();
  }

  void addItemToList(){
    setState(() {
      var Date = DateTime.now();
      int Datemon= Date.day;  //加入月份
      //names.insert(0,nameController.text);
//      msgCount.insert(0, 0); //insert在0的位置加入0
      _chartData.insert(_chartData.length, SalesData(Datemon.toDouble(),St!.toDouble())); //圖表更新
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("睡眠時間"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "選擇您的睡眠時間",
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ),
                DirectSelect(
                    itemExtent: 35.0,
                    selectedIndex: selectedIndex1!,
                    child: MySelectionItem(
                      isForList: false,
                      title: elements1[selectedIndex1!],
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndex1 = index;
                        St = selectedIndex1;
                        addItemToList();
                      });
                    },
                    mode: DirectSelectMode.tap,
                    items: _buildItems1(),

                ),
                SfCartesianChart(
                  title: ChartTitle(text: "睡眠時間",
                  ),
                  legend: Legend(isVisible: false), //顯示下面標籤
                  tooltipBehavior: _tooltipBehavior,
                  series: <ChartSeries>[
                    ColumnSeries<SalesData,double>(
                        //name: '睡眠時間',  //改變標籤名稱
                        dataSource: _chartData,
                        xValueMapper: (SalesData sales, _) => sales.year,  //X軸的資料
                        yValueMapper: (SalesData sales, _) => sales.sales,  //Y軸的資料
                        dataLabelSettings: DataLabelSettings(isVisible: false),
                        enableTooltip: true  //final enable tooltip
                    )
                  ],
                  primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                  primaryYAxis: NumericAxis(
                    labelFormat: '{value}小時',
                    //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0) //$設定US為Default
                  ),
                )

              ]
          ),
        ),
      ),
    );
  }
  List<SalesData> getChartData(){
    final List<SalesData> chartData = [
      SalesData(1, 8),
      SalesData(2, 7),
      SalesData(3, 9),
      SalesData(31, 0),
    ];
    return chartData;
  }
}



class SalesData{
  SalesData(this.year,this.sales);
  final double year;
  final double sales;
}

class MySelectionItem extends StatelessWidget {
  final String? title;
  final bool isForList;

  const MySelectionItem({Key? key, this.title, this.isForList = true}) : super(key: key);

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
        margin: EdgeInsets.symmetric(horizontal: 10.0),
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
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
          child: Text(
            title!,
          )),
    );
  }
}

