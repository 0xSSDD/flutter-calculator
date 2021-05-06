import 'package:flutter/material.dart';
import 'calculator.dart';

class History extends StatelessWidget {
  History({@required this.operations, @required this.timeStamp});

  final List<String> operations;
  final String timeStamp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: false,
      ),
      body: Center(
        child: _operationsList(operations),
      ),
    );
  }

  Widget _operationsList(List<String> operations) {
    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text(operations[i]),
          onTap: () {
            Navigator.pop(context, operations[i]);
          },
          leading: Container(
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.red[800], width: 2.0),
            //     borderRadius: BorderRadius.circular(50)
            // ),
            child: Text(
              'Equation: '+Calculator.parseString(operations[i]) +'\n'+'\n' +'TimeStamp: '+ timeStamp+'\n',
              // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(0.5),
          ),
        );
      },
    );
  }
}