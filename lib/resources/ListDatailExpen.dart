import 'package:contable/resources/BottomIcon.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListDetailExpen extends StatelessWidget {
  final Map<String, int> total;
  final int percent = 10; // Hacer Dynamic
  final IconData icon = FontAwesomeIcons.shoppingCart; //Hacer Dynamic
  final String type = 'Compras';
  final double value = 130.0;

  ListDetailExpen({
    Key key,
    this.total,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: total.length,
        itemBuilder: (BuildContext context, int index) => item(
          total.keys.elementAt(index),
          total.values.elementAt(index),
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: .05,
          thickness: .1,
        ),
      ),
    );
  }

  Widget item(String type, int value) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(
        horizontal: 1,
      ),
      child: Card(
        borderOnForeground: true,
        color: Color.fromRGBO(7, 7, 7, .60),
        elevation: 4,
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.only(
            right: 18,
            left: 18,
          ),
          leading: Icon(
            AutomacticIcons.listIcons[type],
            size: 22.0,
            color: Colors.white.withOpacity(.5),
          ),
          title: Text(
            type,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white.withOpacity(.7),
            ),
          ),
          subtitle: Text(
            '$percent% de los gastos',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue.withOpacity(.7),
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(.2),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '\$$value',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
