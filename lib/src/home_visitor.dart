import 'package:flutter/material.dart';
import './member_auth.dart';
import '../miscellaneous/bottom_navigation.dart';
import 'dart:async';

class HomeVisitor extends StatefulWidget {
  static final String path = "lib/home_visitor.dart";
  @override
  _HomeVisitor createState() => _HomeVisitor();
}

class _HomeVisitor extends State<HomeVisitor> {
  @override
  void dispose() {
    indexcontroller.close();
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEDx CU',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xffb71c1c))),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          indexcontroller.add(index);
        },
        controller: pageController,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bk.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'Events',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bk.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Text(
              'About',
              style: TextStyle(color: Colors.white),
            )),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bk.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: AuthThreePage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: StreamBuilder<Object>(
          initialData: 0,
          stream: indexcontroller.stream,
          builder: (context, snapshot) {
            int cIndex = snapshot.data;
            return BottomNavigation(
              currentIndex: cIndex,
              items: <BottomNavigationItem>[
                BottomNavigationItem(
                    icon: Icon(Icons.home), title: Text('Events')),
                BottomNavigationItem(
                    icon: Icon(Icons.message), title: Text('About')),
                BottomNavigationItem(
                    icon: Icon(Icons.person), title: Text('Member?')),
              ],
              onItemSelected: (int value) {
                indexcontroller.add(value);
                pageController.jumpToPage(value);
              },
            );
          }),
    );
  }
}
