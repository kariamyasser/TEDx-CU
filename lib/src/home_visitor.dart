import 'package:flutter/material.dart';

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
        textAlign: TextAlign.center, style: TextStyle(color:Color(0xffb71c1c))),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
         
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),




      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          indexcontroller.add(index);
        },
        controller: pageController,
        children: <Widget>[
          Center(
            child: Text('Events'),
          ),
          Center(
            child: Text('About'),
          ),
          Center(
            child: Text('Member?'),
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

/*
class xHomeVisitor extends StatelessWidget {
  final String title;


  xHomeVisitor({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     
      appBar: AppBar(
        title: Text('TEDx CU', textAlign: TextAlign.center ,style: TextStyle(color: Color(0xffb71c1c))),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),

      ),
      
         floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');

          },
         ),
        body: Center(child:   Image.asset(
                   
                      'assets/sc5.png',
                      width: 50,
                      height: 50,
                    
                      //  color: Colors.white,
                      fit: BoxFit.cover,
                    )),

        drawer: DarkDrawer(),
                );
          }
        
          
}
*/
