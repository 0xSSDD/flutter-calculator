import 'package:flutter/material.dart';
import '../calculator/calculatorIndex.dart';


class ConverterButtons extends StatelessWidget {
  ConverterButtons({@required this.onTap});

  final CalculatorButtonTapCallback onTap;
  final converterButtonRows = [
    ['7', '8', '9'],
    ['4', '5', '6'],
    ['1', '2', '3'],
    [Calculations.CLEAR,Calculations.KM_MILE, Calculations.MILE_KM]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: converterButtonRows.map((calculatorRowButtons) {
          return CalculatorRow(
            buttons: calculatorRowButtons,
            onTap: onTap,
          );
        }).toList()
    );
  }
}