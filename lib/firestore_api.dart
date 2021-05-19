import 'dart:ffi';

import 'package:calculatorapp/CalculationObject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApi {

  FirebaseFirestore firestore;
  //List<Map<String, dynamic>> calculations = {'':} as List<Map<String, dynamic>>;

  init() {
    firestore = FirebaseFirestore.instance;
  }

  Future<DocumentReference> addData(Map<String, dynamic> data) async {
    init();
    DocumentReference ref = await firestore.collection('calculations').add(data);
    print(ref);
    return ref;
  }

  Future<List<Object>> readAllData() async {
    init();
    print('fireRead0');
    QuerySnapshot snapshot = await firestore.collection('calculations').get();



    print(snapshot.docs.map((e) => e.data()).toList().runtimeType);

    // List<Map<String, dynamic>> calculations = await snapshot.docs.map((e) => e.data()).toList();
    List<Object> calculations = snapshot.docs.map((e) => e.data()).toList();
    print('firestore read');
    print(calculations);
    return calculations;

  }


}