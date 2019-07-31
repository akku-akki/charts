import 'package:flutter/material.dart';
import 'simple.dart';
import 'Statistics.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class MyGraph extends StatefulWidget {
  @override
  _MyGraphState createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  List<charts.Series<Maths,String>> _seriesData;
  _generateData(){
    var data=[
     Maths("Mod 1",10),
     Maths("Mod 2",15),
     Maths("Mod 3", 20),
     Maths("Mod 4", 7),
     Maths("Mod 5", 25),
     Maths("Mod 6", 9),
     Maths("Mod 7", 5),
     Maths("Mod 8", 35),
     Maths("Mod 9", 5),
     Maths("Mod 10", 10)
    ];
    _seriesData.add(charts.Series(
     domainFn: (Maths m ,_)=>m.mod,
     measureFn: (Maths m,_)=>m.marks_,
     id: "007",
     data: data,
     fillPatternFn: (_,__)=> charts.FillPatternType.solid,
     fillColorFn: (Maths m,_)=>charts.ColorUtil.fromDartColor(Color(0xFFA500))
    ));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Maths,String>>();
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
                   child: Center(
                     child: Column(
                       children: <Widget>[
                         Text("Marks Distribution",style:TextStyle(fontSize: 22,
                         fontWeight: FontWeight.normal)),
                         Expanded(
                           child: charts.BarChart(
                             _seriesData,
                             animate: true,
                             animationDuration: Duration(seconds: 2),barRendererDecorator: 
                             charts.BarLabelDecorator(labelPosition: charts.BarLabelPosition.inside),
                             
                           ),
                         )
                       ],
                     ),
                   ),
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
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGraphs()));
                            },
                            color: Colors.red,
                            child: Text("Pie Chart",style: TextStyle(color: Colors.white),),
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
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>My()));
                            },
                            color: Colors.red,
                            child: Text("Statistics",style: TextStyle(color: Colors.white),),
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
  String mod;
 //String marks;
  int marks_;
  Maths(this.mod,this.marks_);
}