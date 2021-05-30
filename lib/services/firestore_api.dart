import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApi {

  FirebaseFirestore firestore;

  init() {
    firestore = FirebaseFirestore.instance;
  }

  Future<DocumentReference> addData(Map<String, dynamic> data) async {
    init();
    DocumentReference ref = await firestore.collection('calculations').add(data);
    return ref;
  }

  Future<List<Object>> readAllData() async {
    init();
    QuerySnapshot snapshot = await firestore.collection('calculations').get();
    List<Object> calculations = snapshot.docs.map((e) => e.data()).toList();
    return calculations;

  }


}