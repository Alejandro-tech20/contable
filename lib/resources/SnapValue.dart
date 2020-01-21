import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SnapValue {
  final int exepValue;
  final int exepDay, exepMonth;
  final String exepType;

  SnapValue(this.exepValue, this.exepDay, this.exepMonth, this.exepType);

  SnapValue.fromMap(Map<String, dynamic> map)
      : assert(map['day'] != null),
        assert(map['month'] != null),
        assert(map['type'] != null),
        assert(map['value'] != null),
        exepDay = map['day'],
        exepMonth = map['month'],
        exepType = map['type'],
        exepValue = map['value'];
}

class CarrierSnapValue {
  final AsyncSnapshot<QuerySnapshot> carrier;
  List<SnapValue> listElemet;
  Map<String, int> listMia;
  var ff=0;
  int i=0;

  CarrierSnapValue(this.carrier) {
    listElemet = carrier.data.documents
        .map((doc) => SnapValue.fromMap(doc.data))
        .toList();
    // listMia = Map.fromIterable(listElemet,
    //     key: (doc) => doc.exepType, value: (doc) => doc.exepValue);
    listMia = Map.fromIterable(listElemet,
        key: (doc) => doc.exepType,
        value: (doc){          
          // var ff=0;
          // for( var el in listElemet){
           ff =  listElemet
              .where((doc) => doc.exepType == listElemet.elementAt(i).exepType)
              .map((doc) => doc.exepValue)
              .fold(0, (a, b) => a + b);
        // }
        i++;
        return ff;
        }
        );    
  }
  List<double> get grahpperday {
    return List.generate(30, (int i) {
      return listElemet
          .where((doc) => doc.exepDay == (i + 1))
          .map((doc) => doc.exepValue)
          .fold(0.0, (a, b) => a + b);
    });
  }
}
