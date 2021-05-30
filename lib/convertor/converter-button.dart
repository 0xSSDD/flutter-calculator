// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
// class ConverterButton extends StatelessWidget{
//   final String text;
//   final Function callback;
//
//   const ConverterButton({
//     this.text,
//     this.callback,
//   });
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       margin: EdgeInsets.all(10.0),
//       child: SizedBox(
//         width: 70,
//         height: 70,
//         child: FlatButton(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5.0),
//           ),
//           child: Text(
//             text,
//             style: GoogleFonts.rubik(
//               textStyle: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           onPressed: () =>callback(text),
//           color: Color(0xFF8ac4d0),
//           textColor: Color(0xFF000000),
//         ),
//       ),
//
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../calculator/calculator.dart';
import '../calculator/calculator-button.dart';
import '../calculator/calculator-row.dart';

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