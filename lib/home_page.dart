import 'package:flutter/material.dart';
import 'component/main_header.dart';
import 'component/main_footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MainHeader(),
          HomeForm(),
          MainFooter(),
        ],
      ),
    );
  }
}

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
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
