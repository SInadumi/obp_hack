import 'package:flutter/material.dart';
import 'package:obp_hack/home_page.dart';
import 'package:obp_hack/post_review_page.dart';
import 'package:obp_hack/profile_page.dart';
import 'package:obp_hack/other_review_page.dart';
import 'package:obp_hack/component/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  RootPage();
  // this widget is the root of homepage
  @override
  Widget build(BuildContext context) {
    final UserInfomation userinfo = Provider.of<UserInfomation>(context);
    final User user = userinfo.user!;
    print(user.email);
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
    HomePage(),
    ProfilePage(),
    OtherReviewPage(),
  ];

  void _onItemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 各画面のAppBarをこの場所に置いておく
      body: _PageWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          // To home_page Icon
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'home',
          ),
          // To profile_page Icon
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Page',
          ),
          // To other_review_page Icon
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
