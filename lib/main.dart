import 'package:flutter/material.dart';

void main() => runApp(new MyApp());









class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return new MaterialApp(
      title: "Calcon",
      theme: new ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.deepOrange,
          brightness: Brightness.dark
      ),
      home: new HomePage(),
    );
  }
}