

import 'package:cloud_firestore/cloud_firestore.dart';

class getData{

  dataFromDB(){
    Stream<QuerySnapshot> snapshot =  Firestore.instance.collection('Content')
                                      .orderBy('order',descending: true).snapshots();
    return snapshot;
  }
}
