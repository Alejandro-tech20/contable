import 'dart:async';
import 'dart:ffi';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contable/Model/ExpensesEntity.dart';
import 'package:contable/resources/service/Expenses.service.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocMio {
  Stream<int> counte;
  Sink<void> increment;
  void dispose() {
    increment.close();
  }
}

class BlocDeVerdad extends BlocMio {
  final ExpensesService _expenseService;
  final _subjectMio = PublishSubject<void>();
  Sink<void> get increment => _subjectMio;
  Stream<int> get counte => _subjectMio.scan((a, _, __) => ++a, 0);
  // -----------------------
  PublishSubject<List<ExpensesEntity>> _subjectExpense = PublishSubject();
  Sink<List<ExpensesEntity>> get listSubjectExpenseEntity =>
      _subjectExpense.sink;
  Observable<List<ExpensesEntity>> get listFlux => _subjectExpense.stream;
  _loadExpenses() async {
    listSubjectExpenseEntity
        .add(await _expenseService.getByTypeAll(type: 'gas'));
  }

  BlocDeVerdad(this._expenseService) {
    _loadExpenses();
  }

  void dispose() {
    _subjectExpense.close();
  }
}

// class ExpensesBloc extends BlocBase {
//   final ExpensesService _expenseService;
//   final PublishSubject<QuerySnapshot> _collectionSubject = PublishSubject();
//   final PublishSubject<List<ExpensesEntity>> _listItemByType =
//       PublishSubject<List<ExpensesEntity>>();
//   final PublishSubject<String> _filterSubject = PublishSubject<String>();
//   // ---------------------------------------------
// final PublishSubject<int> _prueba = PublishSubject();
// Sink<void> get increment => _prueba;
// Stream<int> get counter => _prueba.scan((a,_,__)=> a++,0);
// // -----------------------------------------
//   Sink<List<ExpensesEntity>> get listTypeEvent => _listItemByType.sink;
//   Sink<String> get inFilter => _filterSubject.sink;

//   Observable<QuerySnapshot> get currentCollection => _collectionSubject.stream;
//   Observable<List<ExpensesEntity>> get listTypeFlux => _listItemByType.stream;

//   // _loadExpenses() async {
//   //   listTypeEvent.add(await _expenseService.getByTypeAll(type: 'food'));
//   //   doGetProfile();
//   // }

//   // _loadExpensesFilter({String filter}) {
//   //   _filterSubject.listen((filter) async {
//   //     var collect = await _expenseService.getByTypeAll(type: filter);
//   //     _listItemByType.add(collect);
//   //   });
//   // }

//   ExpensesBloc(this._expenseService) {
//     // _loadExpenses();
//     // _loadExpensesFilter(filter: 'bus');
//     _filterSubject.listen((filter) async {
//       var conta = await _expenseService.getByTypeAll(type: 'bus');
//       print(conta);
//       _listItemByType.add(conta);
//     });
//     _listItemByType.listen((list)=>print(list.length));
//   }

//   @override
//   void dispose() {
//     _listItemByType.close();
//     _collectionSubject.close();
//     // userc.close();
//     _filterSubject.close();
//     super.dispose();
//   }

//   // --------------------------------
// // -------------------------------------
//   // final userc = StreamController<ExpensesEntity>();

//   // Future doGetProfile() async {
//   //   var userQuery = Firestore.instance
//   //       .collection('expenses')
//   //       .where('type', isEqualTo: 'bus');
//   //   await userQuery.getDocuments().then((data) {
//   //     print('$this userQuery.getDocuments()');
//   //     if (data.documents.length > 0) {
//   //       print('$this data found');
//   //       userQuery.snapshots().listen((data) {
//   //         data.documentChanges.forEach((change) {
//   //           print('documentChanges ${change.document.data}');
//   //           userc.sink.add(ExpensesEntity.fromSnapshotMap(data.documents[0]));
//   //         });
//   //       });
//   //     } else {
//   //       print('$this data not found');
//   //     }
//   //   });
//   // }

// // -------------------------------------
// // -------------------------------------

// }
