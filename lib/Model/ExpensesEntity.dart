import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpensesEntity {
  String type, id;
  int day, month;
  int value;
  // String description;

  ExpensesEntity({
    this.id,
    this.type,
    this.day,
    this.month,
    this.value,
    // this.description,
  });

  ExpensesEntity.fromSnapshotMap(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.type = snapshot.data['type'],
        this.day = snapshot.data['day'],
        this.month = snapshot.data['month'],
        this.value = snapshot.data['value'];
        // this.description = snapshot.data['description'];

  static Map<String, dynamic> stringToMap(String s) {
    Map<String, dynamic> map = json.decode(s);
    return map;
  }

  toJson() {
    return {
      'id': this.id,
      'type': this.type,
      'day': this.day,
      'month': this.month,
      'value': this.value,
      // 'description': this.description,
    };
  }
}
