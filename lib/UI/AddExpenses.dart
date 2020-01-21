import 'package:contable/resources/BottomIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Add Gastos',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.windowClose,
            color: Colors.black,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        color: Color.fromRGBO(2, 2, 2, .6),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Placeholder();
  }
}

// class HomeExp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.black,
//         notchMargin: 8.0,
//         shape: CircularNotchedRectangle(),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             BottomIcon(icon: FontAwesomeIcons.history),
//             BottomIcon(icon: FontAwesomeIcons.chartPie),
//             SizedBox(
//               width: 55.0,
//             ),
//             BottomIcon(icon: FontAwesomeIcons.wallet),
//             BottomIcon(icon: FontAwesomeIcons.tools),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           FontAwesomeIcons.plus,
//           color: Colors.black.withOpacity(.20),
//         ),
//         onPressed: () {
//           Navigator.pushReplacementNamed(context, RouteName.addExpenses);
//         },
//       ),
//       // body: ExpBody(),
//     );
//   }
// }
