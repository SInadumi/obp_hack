import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // this widget is the root of homepage
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Read1er Home',
      theme: ThemeData.light(),
      home: HomePageForm(),
    );
  }
}

class HomePageForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigation(),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PostList(),
          ),
        ],
      ),
    );
  }
}

class SideNavigation extends StatefulWidget {
  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.dashboard),
          label: Text('home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.account_circle),
          label: Text('My Page'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.face),
          label: Text('Other people review'),
        ),
      ],
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          PostHeader(),
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Icon'),
        Text('Read1er'),
      ],
    );
  }
}
