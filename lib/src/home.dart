import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../miscellaneous/drawers.dart';

class Home extends StatelessWidget {
  final String title;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Home({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('TEDx CU',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xffb71c1c))),

        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),

        leading: new IconButton(
            icon: new Icon(Icons.apps),
            color: Colors.white,
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        //Scaffold.of(context).openDrawer()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/bk.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Image.asset(
          'assets/sc5.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        )),
      ),
      drawer: DarkDrawer(),
    );
  }
}
