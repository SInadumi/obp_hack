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
          PostForm(),
          PostButton(),
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

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  var ProfileContainer = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: PageView.builder(
          itemBuilder: (context, index) {
            return ProfileContainer[index];
          },
          itemCount: ProfileContainer.length,
        ),
      ),
    );
  }
}

class PostButton extends StatefulWidget {
  @override
  _PostButton createState() => _PostButton();
}

class _PostButton extends State<PostButton> {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        onPressed: () {},
        child: Text('Done!', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
