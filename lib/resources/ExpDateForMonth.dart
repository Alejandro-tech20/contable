import 'package:contable/resources/SnapValue.dart';
import 'package:flutter/material.dart';

class ExpBodyForMonth extends StatelessWidget {
  final List<SnapValue> total;

  ExpBodyForMonth({Key key, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Color.fromRGBO(7, 7, 7, .65),
      elevation: 8,
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        child: _expenses(),
      ),
    );
  }

  Widget _expenses() {
    var total1 = total.fold(0.0, (a,b)=>a+b.exepValue);
                    
    return Column(
      children: <Widget>[
        Text(
          "\$${total1.toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: Colors.white,
          ),
        ),
        Text(
          "Total expenses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
