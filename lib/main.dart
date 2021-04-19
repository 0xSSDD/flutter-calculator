import 'package:flutter/material.dart';

void main() => runApp(new MyApp());




class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> operators = ["+","-","×","÷"];
  List<String> hist = [];
  var history = "", output = "", answer = 0.0;
  void click1() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "1";
      }
      else{
        output = "1";
      }
    });
  }
  void click2() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "2";
      }
      else{
        output = "2";
      }
    });
  }
  void click3() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "3";
      }
      else{
        output = "3";
      }
    });
  }
  void click4() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "4";
      }
      else{
        output = "4";
      }
    });
  }
  void click5() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "5";
      }
      else{
        output = "5";
      }
    });
  }
  void click6() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "6";
      }
      else{
        output = "6";
      }
    });
  }
  void click7() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "7";
      }
      else{
        output = "7";
      }
    });
  }
  void click8() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "8";
      }
      else{
        output = "8";
      }
    });
  }
  void click9() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "9";
      }
      else{
        output = "9";
      }
    });
  }
  void click0() {
    setState(() {
      if (double.parse(output) != 0.0){
        output += "0";
      }
      else{
        output = "0";
      }
    });
  }
  



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