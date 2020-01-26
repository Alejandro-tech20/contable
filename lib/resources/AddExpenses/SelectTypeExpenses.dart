import 'package:flutter/material.dart';

class SelectTypeExpense extends StatefulWidget {
  @override
  _SelectTypeExpenseState createState() => _SelectTypeExpenseState();
}

class _SelectTypeExpenseState extends State<SelectTypeExpense> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
