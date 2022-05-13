import 'package:flutter/material.dart';
import 'package:obp_hack/home.dart';

class RootPage extends StatelessWidget {
  // this widget is the root of homepage
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Read1er Home',
      theme: ThemeData.light(),
      home: RootPageRootForm(),
    );
  }
}

class RootPageRootForm extends StatefulWidget {
  @override
  _RootPageRootFormState createState() => _RootPageRootFormState();
}

class _RootPageRootFormState extends State<RootPageRootForm> {
  /*
    currentIndex : 現在のページ
    _PageWidgets : currentIndexに対応するウィジェット
  */
  int _currentIndex = 0;
  var _PageWidgets = <Widget>[
    PostList(),
    PostList2(),
    PostList(),
  ];

  void _onItemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _PageWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Other people review',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
