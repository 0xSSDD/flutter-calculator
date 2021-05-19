import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'firestore_api.dart';
import 'loader.dart';
import 'CalculationObject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class History extends StatelessWidget {
  History({@required this.operations, @required this.timeStamp});

  final List<String> operations;
  final String timeStamp;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('calculations').snapshots();


  @override
  Widget build(BuildContext context) {
   // List<Map<String, dynamic>> calcFirestore = await FirestoreApi().readAllData();
    // print('calcFirestore');
    //print(calcFirestore);

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: false,
      ),
      body: Center(
        child: deserialize(context),
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

  Widget deserialize(BuildContext context) {
    print('deserialize-check0');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Previous Calculations',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            FutureBuilder<List<Object>>(
              future: FirestoreApi().readAllData(),
              builder: (context, snapshot) {

                if(snapshot.hasError){
                  print('deserialize-err');
                }
                if(snapshot.connectionState == ConnectionState.waiting) {
                  print('deserialize-waiting');
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(snapshot.hasData) {
                  print('deserialize-hasData');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: snapshot.data.map((firebaseCalculation) {
                      CalculationObject tr = CalculationObject.fromJson(firebaseCalculation);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Calculation: ' + (tr.key ?? '')),
                            Text('Answer: ' + (tr.result ?? ''))
                          ],
                        ),
                      );

                    }).toList(),);
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );

}

  @override
  Widget fireDes(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            // CalculationObject tr = CalculationObject.fromJson(document);
            return new ListTile(
              title: new Text(document.data()),

            );
          }).toList(),
        );
      },
    );
  }

}