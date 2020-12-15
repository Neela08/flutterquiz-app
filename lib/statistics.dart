import 'dart:convert';

import 'package:quiz_logic/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class statistics extends StatefulWidget {
  final questionLength,point;
  statistics({this.questionLength,this.point});
  @override
  _statisticsState createState() => _statisticsState();
}

class _statisticsState extends State<statistics> {
    double pc,pw;
  void calculate()
  {
  double c,w;
  c=widget.point/10;
  w= widget.questionLength-c;
  pc=(c/widget.questionLength)*100;
  pw=(w/widget.questionLength)*100;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculate();
  }


  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Correct', pc, Color.fromRGBO(0, 0, 102, 1)),
      ChartData('Wrong  (in %)', pw, Color.fromRGBO(255, 179, 255, 1)),
    //  ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
    //  ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
    ];
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 70,left: 20,right: 20),
         child: Column(

           children: [
             Text('Your Score is',style: TextStyle(fontSize: 20.0,),),
             Text(widget.point.toString(),style: TextStyle(fontSize: 35.0,color: Colors.indigo),),
             Container(
                    margin: EdgeInsets.only(top: 20.0),
                   child: SfCircularChart(
                       legend: Legend(isVisible: true,
                           position: LegendPosition.bottom,
                       ),
                       borderWidth: 3,
                       series: <CircularSeries>[
                         // Renders doughnut chart
                         DoughnutSeries<ChartData, String>(
                             dataSource: chartData,
                             pointColorMapper: (ChartData data, _) => data.color,
                             xValueMapper: (ChartData data, _) => data.x,
                             yValueMapper: (ChartData data, _) => data.y,
                             dataLabelSettings: DataLabelSettings(
                               // Renders the data label
                               isVisible: true,


                             )
                         )
                       ]
                   ),

               ),

             InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) => MyHomePage()
             ));},
               child:Container(
                 margin: EdgeInsets.only(top: 70),
                 height: 70,
                 width: 100,
                 //padding: EdgeInsets.all(30.0),
                 decoration: BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.circular(45.0)
                 ),

                 child: Center(
                     child: Text('Try Again',style: TextStyle(color: Colors.white),)
                 ) ,),

             )

           ],
         ),

        )
    );
  }
}
  class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
  }