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
  void clickDot() {
    setState(() {
      output += ".";
    });
  }
  void clear() {
    setState(() {
      history = "";
      output = "0";
      answer = 0.0;
      hist = [];
    });
  }
  void sign() {
    setState(() {
      if (double.parse(output) == 0.0){}
      else {
        if (output[0] == '-'){
          output = output.substring(1);
        }
        else {
          output = '-' + output;
        }
      }
    });
  }
  void percent() {
    setState(() {
      double percent = 0.0;
      percent = answer/100;
      history = answer.toString() + " ÷ 100 =";
      output = percent.toString();
    });
  }

  void add() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("+");
      if (hist.length >= 3){
        output = "0";
        equals();
      }
      output="0";
      history = getTape();
    });
  }
  void sub() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("-");
      if (hist.length >= 3){
        output = "0";
        equals();
      }
      output="0";
      history = getTape();
    });
  }
  void div() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("÷");
      if (hist.length >= 3){
        output = "0";
        equals();
      }
      output="0";
      history = getTape();
    });
  }
  void mul() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("×");
      if (hist.length >= 3){
        output = "0";
        equals();
      }
      output="0";
      history = getTape();
    });
  }

  String getTape(){
    return hist.join(" ");
  }

  bool isOperator(String s){
    return (operators.contains(s));
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s) != null;
  }

  void equals(){
    setState(() {
      if (hist.length <= 3){
        hist.add(output);
      }
      history = getTape() + " =";
      var opr1, opr2, op;
      opr1 = double.parse(hist.removeAt(0));
      op = hist.removeAt(0);
      opr2 = double.parse(hist.removeAt(0));
      switch (op) {
        case "+": answer = opr1 + opr2; break;
        case "-": answer = opr1 - opr2; break;
        case "×": answer = opr1 * opr2; break;
        case "÷": answer = opr1 / opr2; break;
        default:
      }
      output = answer.toString();
      hist.insert(0, answer.toString());
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.red[700],
          title: new Image.asset('assets/title.png')
      ),
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(top: 25.0, right: 15.0),
                child: new Text(
                  "$history",
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0, right: 15.0, bottom: 15.0),
                child: new Text(
                  "$output",
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
             




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