import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import 'package:direct_select/direct_select.dart';
import 'package:hive/hive.dart';
import "package:syncfusion_flutter_charts/charts.dart";
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

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
  late TextEditingController _controller3;
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  int? selectedIndex1 = 0;
  String St = "";

  Box<String> sleeptime_box = Hive.box('alldata');

  @override
  void initState(){
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
    if (sleeptime_box.containsKey(select_day)) {

    }
    else {
      setState(() {
        var Date = DateTime.now();
        int Datemon = Date.day; //加入月份
        //names.insert(0,nameController.text);
//      msgCount.insert(0, 0); //insert在0的位置加入0
        _chartData.insert(_chartData.length,
            SalesData(datetime, double.parse(sleeptime))); //圖表更新
      });
      sleeptime_box.put(select_day, sleeptime);
      print(sleeptime_box);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("睡眠時間"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SingleChildScrollView(
                  child: Form(
                    key: _oFormKey,
                    child: Column(
                      children: <Widget>[
                        DateTimePicker(
                          type: DateTimePickerType.date,  //顯示格式
                          dateMask: 'Md',  //需求資料格式
                          controller: _controller3,  //
                          //initialValue: _initialValue,
                          firstDate: DateTime(2000), //範圍
                          lastDate: DateTime(2100),   //範圍
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          //locale: Locale('pt', 'BR'),
                          selectableDayPredicate: (date) {
                            return true;
                          },
                        ),],
                    ),
                  ),
                ),
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
                        St = elements1[selectedIndex1!];
                        addItemToList(St);
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
                    ColumnSeries<SalesData,DateTime>(
                        //name: '睡眠時間',  //改變標籤名稱
                        dataSource: _chartData,
                        xValueMapper: (SalesData sales, _) => sales.year,  //X軸的資料
                        yValueMapper: (SalesData sales, _) => sales.sales,  //Y軸的資料
                        dataLabelSettings: DataLabelSettings(isVisible: false),
                        enableTooltip: true  //final enable tooltip
                    )
                  ],
                  primaryXAxis: DateTimeAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
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
    final List<SalesData> chartData = [];
    return chartData;
  }
}



class SalesData{
  SalesData(this.year,this.sales);
  final DateTime year;
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

