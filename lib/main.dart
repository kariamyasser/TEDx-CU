import 'package:flutter/material.dart';
import './src/home_visitor.dart';
import './src/home.dart';

void main() => runApp(MyApp());

//or void main(){runApp();} lw 3ndy one line func. inline
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.red,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black38,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomeVisitor(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => Home(),
        '/homevisitor': (context) => HomeVisitor(),
      },
    );
  }
}
