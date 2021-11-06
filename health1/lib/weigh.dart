import 'package:flutter/material.dart';
import "package:flutter/rendering.dart";
import "package:syncfusion_flutter_charts/charts.dart";
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      supportedLocales: [  Locale.fromSubtags(languageCode: 'zh'), // generic Chinese 'zh'
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
  const weight({Key? key}) : super(key: key);

  @override
  _weightState createState() => _weightState();

}
class _weightState extends State<weight> {
  final List<String> names = <String>[];  //預先加入的資料集
  TextEditingController nameController = TextEditingController();//擷取文字用

  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _controller3;

  late List<weightData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    super.initState();
    _controller3 = TextEditingController(text: DateTime.now().toString());
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _getValue();

  }
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
      });
    }); //並沒有實際功能
  }
  void addItemToList(){
    setState(() {
      var Date = DateTime.now();
      names.insert(0,nameController.text);
//      msgCount.insert(0, 0); //insert在0的位置加入0
      _chartData.insert(_chartData.length, weightData(DateTime.parse(_controller3.text),double.parse(nameController.text))); //圖表更新
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
 //           Expanded(
 //               child: ListView.builder(
 //                   padding: const EdgeInsets.all(8),
    //                   itemCount: names.length,
    //                   itemBuilder: (BuildContext context, int index) {
    //                     return Container(
    //                       height: 50,
    //                      margin: EdgeInsets.all(2),
    //                     color: Colors.blue,
    //                   //                        msgCount[index]>=10? Colors.blue[400]:
//                        msgCount[index]>3? Colors.blue[100]: Colors.grey,
    //                   child: Center(
    //                      child: Text('${names[index]} ',
    //                        style: TextStyle(fontSize: 18),
    //                       )
    //                   ),
    //                 );
    //               }   //顯示加入值時使用(廢棄)
    //            )
            //        ),
            SfCartesianChart(
              title: ChartTitle(text: "體重紀錄日誌",
              ),
              legend: Legend(isVisible: true), //顯示下面標籤
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[
                LineSeries<weightData,DateTime>(
                    name: '體重',  //改變標籤名稱
                    dataSource: _chartData,
                    xValueMapper: (weightData sales, _) => sales.year,  //X軸的資料
                    yValueMapper: (weightData sales, _) => sales.kgwieght,  //Y軸的資料
                    dataLabelSettings: DataLabelSettings(isVisible: false), //取消在圖表上顯示
                    enableTooltip: true  //final enable tooltip
                )
              ],
              primaryXAxis: DateTimeAxis(), //設定X軸為DateTime格式
              primaryYAxis: NumericAxis(   //設定Y軸為數字格式
                labelFormat: '{value}公斤',
                //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0) //$設定US為Default
              ),
            ),
          ]
      )
    );
  }
  List<weightData> getChartData(){
    final List<weightData> chartData = [
    ];
    return chartData;
  }
}
class weightData{
  weightData(this.year,this.kgwieght);
  final DateTime year;
  final double kgwieght;
}