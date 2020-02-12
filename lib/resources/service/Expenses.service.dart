import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contable/Model/ExpensesEntity.dart';

class ExpensesService {
  static final String _baseUrl = 'expenses';
  final CollectionReference _db;

  ExpensesService() : this._db = Firestore.instance.collection(_baseUrl);

// Total por mes que se selecciona en el menu
  // Future<double> totalForMonth(int currentPage) async {
  //   final CollectionReference _db3 = Firestore.instance.collection('expenses');
  //   Stream<QuerySnapshot> _dbQuery = _db3.where('month', isEqualTo: currentPage + 1).snapshots();
  //   List<ExpensesEntity> lista = await _dbQuery.document.
  //   double total = _dbQuery.fold(0.0, (a, b) => a + b.value);
  //   return total;
  // }// ---------------------

  Stream<QuerySnapshot> getByTypeAll2() {
    return Firestore.instance
        .collection(_baseUrl)
        .where("type", isEqualTo: "food")
        .snapshots();
  }

  Future<ExpensesEntity> save(ExpensesEntity entity) async {
    if (entity.id == null) entity.id = _db.document().documentID;
    await _db.document(entity.id).setData(entity.toJson());
    return entity;
  }

  Future<List<ExpensesEntity>> getByTypeAll({
    String type,
  }) async {
    final CollectionReference _db2 = Firestore.instance.collection(_baseUrl);
    QuerySnapshot query =
        await _db2.where("type", isEqualTo: type).getDocuments();
    List<ExpensesEntity> expItem = query.documents
        .map((doc) => ExpensesEntity.fromSnapshotMap(doc))
        .toList();
    return expItem;
  }
}
