import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contable/Manager/Observer.dart';
import 'package:contable/resources/ExpDateForMonth.dart';
import 'package:contable/resources/ListDatailExpen.dart';
import 'package:contable/resources/SnapValue.dart';
import 'package:flutter/material.dart';
import 'ExpenseGraph.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class ExpBodyResources extends StatefulWidget {
  @override
  _ExpBodyResourcesState createState() => _ExpBodyResourcesState();
}

class _ExpBodyResourcesState extends State<ExpBodyResources> {
  PageController _controller;
  int currentPage = DateTime.now().month - 1;
  Stream<QuerySnapshot> _streamBDQuery;
  int i = 0;
  // final CollectionReference _bd= Firestore.instance.collection('expenses');

  @override
  void initState() {
    super.initState();

    _streamBDQuery = Firestore.instance
        .collection('expenses')
        .where("month", isEqualTo: currentPage + 1)
        .snapshots();
    _controller = PageController(
      initialPage: currentPage,
      viewportFraction: 0.4,
    );
    // print(_bd.document(_bd.document().documentID).setData(data));

    // _bd.listen((data) {
    //   print(data);
    // }, onDone: () {
    //   print('terminado');
    // }, onError: (error) {
    //   print(error);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _selector(),
          Observer<QuerySnapshot>(
            stream: _streamBDQuery,
            onSuccess:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> data) =>
                    buildExpanded(data),
          ),
          // Card(
          //   borderOnForeground: true,
          //   color: Color.fromRGBO(7, 7, 7, .65),
          //   elevation: 8,
          //   margin: EdgeInsets.symmetric(
          //     vertical: 0.0,
          //   ),
          //   child: Container(
          //       width: MediaQuery.of(context).size.width - 10,
          //       child: _graph()),
          // ),
        ],
      ),
    );
  }

  Expanded buildExpanded(AsyncSnapshot<QuerySnapshot> data) {
    CarrierSnapValue total = CarrierSnapValue(data);
    return Expanded(
      child: Column(
        children: <Widget>[
          ExpBodyForMonth(
            total: total.listElemet,
          ),
          Container(
            height: 140.0,
            child: GraphWidget(data: total.grahpperday),
          ),
          SizedBox(
            height: 8,
          ),
          ListDetailExpen(
            total: total.listMia,
          ),
        ],
      ),
    );
  }

  Widget _pageItem(String name, int position) {
    var _alignment;
    final selected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );
    final unselected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.green.withOpacity(0.6),
    );

    if (position == currentPage) {
      _alignment = Alignment.center;
    } else if (position > currentPage) {
      _alignment = Alignment.centerRight;
    } else {
      _alignment = Alignment.centerLeft;
    }

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(7, 7, 7, .75),
        borderRadius: BorderRadius.circular(20),
      ),
      // height: 5000.0,
      // width: 100,

      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Align(
        alignment: _alignment,
        child: Text(
          name,
          style: position == currentPage ? selected : unselected,
        ),
      ),
    );
  }

  Widget _selector() {
    return SizedBox.fromSize(
      size: Size.fromHeight(50.0),
      child: PageView(
        onPageChanged: (newPage) {
          setState(() {
            currentPage = newPage;
            _streamBDQuery = Firestore.instance
                .collection('expenses')
                .where('month', isEqualTo: currentPage + 1)
                .snapshots();
          });
        },
        controller: _controller,
        children: <Widget>[
          _pageItem("Enero", 0),
          _pageItem("Febrero", 1),
          _pageItem("Marzo", 2),
          _pageItem("Abril", 3),
          _pageItem("Mayo", 4),
          _pageItem("Junio", 5),
          _pageItem("Julio", 6),
          _pageItem("Agosto", 7),
          _pageItem("Septiembre", 8),
          _pageItem("Octubre", 9),
          _pageItem("Noviembre", 10),
          _pageItem("Diciembre", 11),
        ],
      ),
    );
  }
}
