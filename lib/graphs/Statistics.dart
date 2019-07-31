import 'package:flutter/material.dart';
import 'simple.dart';
import 'bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  List<charts.Series<Maths,int>> _seriesLineData;
  _generateData(){
    var mod_1=[
      Maths(2014, 10),
      Maths(2015,15),
      Maths(2016,20),
      Maths(2017,7),
      Maths(2018,22)
    ];
    var mod_2=[
      Maths(2014, 22),
      Maths(2015,10),
      Maths(2016,15),
      Maths(2017, 7),
      Maths(2018, 25),
    ];
    var mod_3=[
      Maths(2014, 32),
      Maths(2015,9),
      Maths(2016,12),
      Maths(2017, 18),
      Maths(2018, 22),
    ];
    var mod_4=[
    Maths(2014, 9),
    Maths(2015,10),
    Maths(2016,25),
    Maths(2017,22),
    Maths(2018,27),
    ];
    var mod_5 = [
      Maths(2014, 22),
      Maths(2015,26),
      Maths(2016,7),
      Maths(2017,0),
      Maths(2018,15),
    ];
    var mod_6 = [
     Maths(2014,2),
     Maths(2015, 6),
     Maths(2016,7),
     Maths(2017,5),
     Maths(2018,10)
    ];
    var mod_7 =[
      Maths(2014,22),
      Maths(2015,23),
      Maths(2016,25),
      Maths(2017,10),
      Maths(2018,15),
    ];
    var mod_8 = [
      Maths(2014,7),
      Maths(2015,10),
      Maths(2016,15),
      Maths(2017,20),
      Maths(2018,25),
    ];
    _seriesLineData.add(charts.Series(
      colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "007"
      ,data: mod_1,
      domainFn: (Maths m,_)=>m.year,
      measureFn: (Maths m ,_)=>m.value
    ));
    _seriesLineData.add(charts.Series(
      colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "007"
      ,data: mod_2,
      domainFn: (Maths m,_)=>m.year,
      measureFn: (Maths m ,_)=>m.value
    ));
    _seriesLineData.add(charts.Series(
      colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "007"
      ,data: mod_3,
      domainFn: (Maths m,_)=>m.year,
      measureFn: (Maths m ,_)=>m.value
    ));
    _seriesLineData.add(charts.Series(
      colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "007"
      ,data: mod_4,
      domainFn: (Maths m,_)=>m.year,
      measureFn: (Maths m ,_)=>m.value
    ));
    _seriesLineData.add(charts.Series(
      colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "007"
      ,data: mod_5,
      domainFn: (Maths m,_)=>m.year,
      measureFn: (Maths m ,_)=>m.value
    ));
    _seriesLineData.add(charts.Series(
      colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "007"
      ,data: mod_6,
      domainFn: (Maths m,_)=>m.year,
      measureFn: (Maths m ,_)=>m.value
    ));
    _seriesLineData.add(charts.Series(
      colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "007"
      ,data: mod_7,
      domainFn: (Maths m,_)=>m.year,
      measureFn: (Maths m ,_)=>m.value
    ));
    _seriesLineData.add(charts.Series(
      colorFn: (_,__)=>charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "007"
      ,data: mod_8,
      domainFn: (Maths m,_)=>m.year,
      measureFn: (Maths m ,_)=>m.value,
    ));
  
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesLineData = List<charts.Series<Maths,int>>();
    _generateData();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
          child: Container(
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: <Widget>[
                  Container(
                   margin: EdgeInsets.all(20),
                   height:MediaQuery.of(context).size.height *0.80 ,
                   width: MediaQuery.of(context).size.height *0.80,
                   //color: Colors.white,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: Center(child: Column(
                     children: <Widget>[
                       Text("Statistics for 5 years",style: TextStyle(
                         fontSize:22,fontWeight: FontWeight.normal 
                       ),),
                       Expanded(
                         child: charts.LineChart(
                           _seriesLineData,
                           defaultRenderer: charts.LineRendererConfig(
                             includeArea: true,
                             stacked: true
                           ),
                           animate:true,
                           animationDuration: Duration(seconds: 5),
                           behaviors: [
                            charts.ChartTitle("Years",
                            behaviorPosition: charts.BehaviorPosition.bottom,
                            titleOutsideJustification: charts.OutsideJustification.startDrawArea
                            ) ,
                            charts.ChartTitle("Marks",
                            behaviorPosition: charts.BehaviorPosition.start,
                            titleOutsideJustification: charts.OutsideJustification.middleDrawArea
                            ) ,
                            charts.ChartTitle("Modules",
                            behaviorPosition: charts.BehaviorPosition.end,
                            titleOutsideJustification: charts.OutsideJustification.middleDrawArea
                            ) ,
                            
                           ],
                         ),
                       )
                     ],
                   ),),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                   height:MediaQuery.of(context).size.height *0.1 ,
                   width: MediaQuery.of(context).size.height *0.80,
                   //color: Colors.white,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius:BorderRadius.circular(20),
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                       child: MaterialButton(
                            splashColor: Colors.yellow,
                            onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGraph()));
                            },
                            color: Colors.red,
                            child: Text("Bar Graph",style: TextStyle(color: Colors.white),),
                            shape: StadiumBorder(),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                        child: MaterialButton(
                            splashColor: Colors.yellow,
                            onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGraphs()));
                            },
                            color: Colors.red,
                            child: Text("Pie Chart",style: TextStyle(color: Colors.white),),
                            shape: StadiumBorder(),
                          ),
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),
            
           
          ],

        ),
        
      ),
    );
  }
}
class Maths{
  int year;
  int value;
  Maths(this.year,this.value);
}