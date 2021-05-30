import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'converter-button.dart';
import '../calculator/calculator.dart';
import '../calculator/number-display.dart';


class ConverterPage extends StatefulWidget {
  ConverterPage({Key key}): super(key:key);
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Converter'),
          centerTitle: false,
        ),
        body: Column(
          children: <Widget>[
            NumberDisplay(value: calculatorString),
            ConverterButtons(onTap: _onPressed),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
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
    // On KM_MILE press
    if (buttonText == Calculations.KM_MILE) {
      return setState(() {
       double km = double.parse(calculatorString);
       double miles = km * 0.621371;
       calculatorString = '${miles}';
      });
    }
    // On MILE_KM press
    if (buttonText == Calculations.MILE_KM) {
      return setState(() {
        double miles = double.parse(calculatorString);
        double km = miles / 0.621371;
        calculatorString = '${km}';
      });
    }

    // On Equals press
    if (buttonText == Calculations.EQUAL) {
      String newCalculatorString = Calculator.parseString(calculatorString);

      return setState(() {
        if (newCalculatorString != calculatorString) {
          // only add evaluated strings to calculations array
          calculations.add(calculatorString);
        }

        operations.add(Calculations.EQUAL);
        calculatorString = newCalculatorString;
        isNewEquation = false;
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
