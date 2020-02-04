import 'package:contable/resources/AddExpenses/SelectTypeExpenses.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyAddExpenses extends StatefulWidget {
  @override
  _BodyAddExpensesState createState() => _BodyAddExpensesState();
}

class _BodyAddExpensesState extends State<BodyAddExpenses> {
  List<IconDetail> list = [
    IconDetail(Icon(FontAwesomeIcons.glasses), Text('Dia')),
    IconDetail(Icon(FontAwesomeIcons.glasses), Text('Semana')),
    IconDetail(Icon(FontAwesomeIcons.glasses), Text('Mes')),
  ];
  int selectec = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //botones de seleccion de mes, dia, semana.
          Container(
            height: 55,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.amber,
            ),
            width: MediaQuery.of(context).size.width,
            // color: Colors.transparent,
            child: Container(
              width: 150,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: list.map((item) {
                  var itemIdex = list.indexOf(item);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectec = itemIdex;
                      });
                    },
                    child: _buidIcon(item, selectec == itemIdex),
                  );
                }).toList(),
              ),
            ),
          ),
          SelectTypeExpense(),
          _valor(),
          _numpad(),
          _submit(),
        ],
      ),
    );
  }

  Widget _valor() {
    return Placeholder(
      fallbackHeight: 80.0,
    );
  }

  Widget _numpad() {
    return Placeholder(
      fallbackHeight: 300.0,
    );
  }

  Widget _submit() {
    return Expanded(
      child: Placeholder(
        fallbackHeight: 40.0,
      ),
    );
  }

  Widget _buidIcon(IconDetail item, bool isSelected) {
    return Row(
      children: [
        item.icon,
        isSelected ? item.text : Container(),
      ],
    );
  }
}

class IconDetail {
  final Icon icon;
  final Text text;
  IconDetail(this.icon, this.text);
}
