import 'package:flutter/material.dart';
import 'graphs/simple.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "graphs",
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MyGraphs(),
    );
  }
}
