import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'convertor/convertorIndex.dart';
import 'calculator/calculatorIndex.dart';
import 'services/servicesIndex.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';
  // var now = DateTime.now();
  String _timeString = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
            return Scaffold(
                appBar: AppBar(
                  title: Text(widget.title),
                  centerTitle: false,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.car_rental),
                      onPressed: () {
                        _navigateAndDisplayConverter(context);
                      },
                    ),
                    IconButton(
                        icon: Icon(Icons.history), onPressed: () {
                      _navigateAndDisplayHistory(context);
                    })
                  ],
                ),
                body: Column(
                  children: <Widget>[
                    NumberDisplay(value: calculatorString),
                    CalculatorButtons(onTap: _onPressed),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ));
        }
    );
  }


  addOperationsToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('operations', operations.toString());
  }

  void _getTime() {
    final String formattedDateTime =
    DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      print(_timeString);
    });
  }
  _navigateAndDisplayConverter(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConverterPage())
    );

    if (result != null) {
      setState(() {
        isNewEquation = false;
        calculatorString = Calculator.parseString(result);
      });
    }
  }

  _navigateAndDisplayHistory(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => History(operations: calculations, timeStamp: _timeString,))
    );

    if (result != null) {
      setState(() {
        isNewEquation = false;
        calculatorString = Calculator.parseString(result);
      });
    }
  }

  void _onPressed({String buttonText}) {
    // Standard mathematical operations
    if (Calculations.OPERATIONS.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText);
        calculatorString += " $buttonText ";
      });
    }

    // On CLEAR press
    if (buttonText == Calculations.CLEAR) {
      return setState(() {
        operations.add(Calculations.CLEAR);
        calculatorString = "";
      });
    }

    // On Equals press
    if (buttonText == Calculations.EQUAL) {
      _getTime();
      String newCalculatorString = Calculator.parseString(calculatorString);

      return setState(() {
        if (newCalculatorString != calculatorString) {
          // only add evaluated strings to calculations array
          calculations.add(calculatorString);
        }

        operations.add(Calculations.EQUAL);

        print(newCalculatorString);
        Map<String, dynamic> calcMap = {'key': calculatorString, 'result': newCalculatorString};
        FirestoreApi().addData(calcMap);
        calculatorString = newCalculatorString;
        isNewEquation = false;

      });
    }

    if (buttonText == Calculations.PERIOD) {
      return setState(() {
        calculatorString = Calculator.addPeriod(calculatorString);
      });
    }

    setState(() {
      if (!isNewEquation
          && operations.length > 0
          && operations.last == Calculations.EQUAL
      ) {
        calculatorString = buttonText;
        isNewEquation = true;
      } else {
        calculatorString += buttonText;
      }
    });
  }
}
