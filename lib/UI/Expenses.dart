import 'package:contable/UI/AddExpenses.dart';
import 'package:contable/resources/ExpBodyResouces.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  int pageIndex = 1;
  Map<int, Widget> listPage = {
    0: BodyAddExpenses(),
    1: ExpBodyResources(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Color.fromRGBO(7, 7, 7, .6),
          backgroundColor: Color.fromRGBO(7, 7, 7, .6),
          buttonBackgroundColor: Colors.transparent,
          // height: 55,
          shadow: 5.0,
          animationDuration: Duration(
            milliseconds: 300,
          ),
          index: 0,
          items: [
            CurvedNavigationItem(
              icon: Icon(Icons.add, size: 30,), text: Text('Add'),
            ),
            CurvedNavigationItem(
              icon: Icon(Icons.list, size: 30,), text: Text('List'),
            ),
            // Icon(
            //   FontAwesomeIcons.plus,
            //   size: 15,
            //   color: Colors.white,
            // ),
            // Icon(
            //   FontAwesomeIcons.chartBar,
            //   size: 15,
            //   color: Colors.white,
            // ),
            // Icon(
            //   FontAwesomeIcons.businessTime,
            //   size: 15,
            //   color: Colors.white,
            // ),
          ],
          onTap: (index) {
           setState(() {
             pageIndex=index;
           });
          },
        ),
        body: listPage[pageIndex],
      ),
    );
  }
}
