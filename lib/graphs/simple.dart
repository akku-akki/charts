import 'package:flutter/material.dart';
import 'Statistics.dart';
import 'bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class MyGraphs extends StatefulWidget {
  @override
  _MyGraphsState createState() => _MyGraphsState();
}

class _MyGraphsState extends State<MyGraphs> {
 List<charts.Series<Maths,String>> _seriesPieData;
 _generateData(){
   var piedata = [
     Maths("module 1",10,Color(0xff3366cc)),
     Maths("module 2",15,Color(0xff990099)),
     Maths("module 3",18,Color(0xff109618)),
     Maths("module 4",20,Color(0xfffdbe19)),
     Maths("module 5",25,Color(0xffff9900)),
     Maths("module 6",10,Color(0xffdc3912)),
     Maths("module 7",10,Color(0xff3366cc)),
     Maths("module 8",5,Color(0xff990099)),
     Maths("module 9",17,Color(0xff109618)),
     Maths("module 10",20,Color(0xfffdbe19)),
   ];
   _seriesPieData.add(
     charts.Series(
      domainFn: (Maths m,_)=> m.mod,
      measureFn: (Maths m,_)=>m.value,
      colorFn: (Maths m ,_)=> charts.ColorUtil.fromDartColor(m.colorval),
      id: "Maths",
      data: piedata,
      labelAccessorFn: (Maths m,_)=>"${m.value}" 
     )
   );
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData= List<charts.Series<Maths,String>>();
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
                         Text("Marks Distribution",style:TextStyle(
                           fontSize: 24.0,fontWeight: FontWeight.bold
                         )),
                         SizedBox(height: 10,),
                         Expanded(
                           child: charts.PieChart(
                             _seriesPieData,
                             animate: true,
                             animationDuration: Duration(seconds: 2),
                             behaviors: [
                               charts.DatumLegend(
                                 outsideJustification: charts.OutsideJustification.endDrawArea,
                                 horizontalFirst: false,
                                 desiredMaxRows: 4,
                                 cellPadding: EdgeInsets.only(right: 4.0,bottom: 4.0),
                                 entryTextStyle: charts.TextStyleSpec(color:charts.MaterialPalette.purple.shadeDefault,
                                 fontFamily: "Georgia",
                                 fontSize: 11),
                               )
                             ],
                              defaultRenderer: charts.ArcRendererConfig(
                               arcWidth: 105,
                                arcRendererDecorators: [
                                  charts.ArcLabelDecorator(labelPosition: 
                                  charts.ArcLabelPosition.inside)
                                ]
                              ),
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
  double value;
  Color colorval;
  Maths(this.mod,this.value,this.colorval);
}