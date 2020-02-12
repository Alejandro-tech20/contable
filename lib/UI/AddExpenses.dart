import 'package:contable/Model/ExpensesEntity.dart';
import 'package:contable/resources/AddExpenses/SelectTypeExpenses.dart';
import 'package:contable/resources/bloc/ExpensesBloc.dart';
import 'package:contable/resources/service/Expenses.service.dart';
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
  //  ExpensesBloc _miBloc = ExpensesBloc(ExpensesService());
  BlocDeVerdad bloc = BlocDeVerdad(ExpensesService());
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
          Center(
            child: FloatingActionButton(
                onPressed: () =>
                    bloc.increment.add(null)), //=>_miBloc.increment.add(null)),
          )
          // _numpad(),
          // _submit(),
        ],
      ),
    );
  }

  Widget _valor() {
    return StreamBuilder(
        stream: bloc.listFlux, //null,//_miBloc.counter,
        builder: (context, AsyncSnapshot<List<ExpensesEntity>> snapshot) {
          return Container(
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      '${snapshot.data.length ?? 0} ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) => item(
                          snapshot.data.elementAt(index),
                          // snapshot.data..elementAt(index),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                          height: .05,
                          thickness: .1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            
          );
        });

    // return StreamBuilder(
    //     stream: _miBloc.userc.stream,
    //     builder: (BuildContext context, AsyncSnapshot<ExpensesEntity> user) {
    //       return new Center(
    //         child: new Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             user.hasData
    //                 ? new Container(
    //                     width: 80,
    //                     height: 80,
    //                     decoration: new BoxDecoration(
    //                       borderRadius: BorderRadius.circular(100.0),
    //                       // image: new DecorationImage(
    //                       //   image: NetworkImage(user.data.photo),
    //                       //   fit: BoxFit.cover,
    //                       // ),
    //                     ),
    //                   )
    //                 : new Container(
    //                     width: 50,
    //                     height: 50,
    //                     child: new CircularProgressIndicator(
    //                       strokeWidth: 2,
    //                       // valueColor:
    //                       //     AlwaysStoppedAnimation<Color>(ColorsConst.base),
    //                     ),
    //                   ),
    //             new Container(
    //               margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
    //               child: new Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: <Widget>[
    //                   new Text(
    //                     user.hasData
    //                         ? '${user.data.type.toUpperCase()}'
    //                         : 'loading',
    //                     // style: TextStyleConst.b16(
    //                     //     color: Colors.black
    //                     //         .withOpacity(user.hasData ? 1.0 : 0.2),
    //                     //     letterSpacing: 2),
    //                   ),
    //                   new Container(
    //                     margin: EdgeInsets.all(5),
    //                   ),
    //                   new Text(
    //                     user.hasData ? '${user.data.value}' : 'loading',
    //                     // style: TextStyleConst.n14(
    //                     //     color: Colors.black
    //                     //         .withOpacity(user.hasData ? 1.0 : 0.2)),
    //                   ),
    //                   new Container(
    //                     margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    //                     padding: EdgeInsets.all(10),
    //                     decoration: new BoxDecoration(
    //                       color: Colors.blue,
    //                       borderRadius: BorderRadius.circular(100.0),
    //                     ),
    //                     child: new Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: <Widget>[
    //                         new Row(
    //                           children: <Widget>[
    //                             new Icon(
    //                               Icons.trending_up,
    //                               color: Colors.white,
    //                               size: 20,
    //                             ),
    //                             new Text(
    //                               '145K',
    //                               // style:
    //                               //     TextStyleConst.b14(color: Colors.white),
    //                             ),
    //                           ],
    //                         ),
    //                         new Container(
    //                           margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    //                         ),
    //                         new Row(
    //                           children: <Widget>[
    //                             new Icon(
    //                               Icons.trending_down,
    //                               color: Colors.white,
    //                               size: 20,
    //                             ),
    //                             new Text(
    //                               '17',
    //                               // style:
    //                               //     TextStyleConst.b14(color: Colors.white),
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     }
    // );
  }
  // return StreamBuilder(
  //   stream: _miBloc.userc.stream,
  //   builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return Expanded(
  //       child: ListView.separated(
  //         itemCount: 3,
  //         itemBuilder: (BuildContext context, int index) => item(
  //           snapshot.data[index],
  //         ),
  //         separatorBuilder: (BuildContext context, int index) => Divider(
  //           height: .05,
  //           thickness: .1,
  //         ),
  //       ),
  //     );
  //   },
  // );
  // }

  Widget item(ExpensesEntity item) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(
        horizontal: 1,
      ),
      child: Card(
        // borderOnForeground: true,
        color: Colors.amberAccent,
        elevation: 4,
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.only(
            right: 18,
            left: 18,
          ),
          leading: Icon(
            Icons.monetization_on,
            size: 22.0,
            color: Colors.white.withOpacity(.5),
          ),
          title: Text(
            item.value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            ' de los gastos',
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
                '\$${item.value}',
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
