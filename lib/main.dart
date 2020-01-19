import 'package:flutter/material.dart';
import 'UI/Expenses.dart';
import 'UI/Index.dart';
import 'resources/RouteName.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuadrante de Horarios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.home,
      routes: {
        RouteName.home: (context) => Home(),
        RouteName.index: (context) => Index(
              title: 'Hola',
            ),
        RouteName.expenses: (context) => Expenses(),
        // RouteName.expenses: (context) => ExpBody(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final twee = TrackT
    return Scaffold(
      body: Index(),
    );
  }
}
