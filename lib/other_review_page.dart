import 'package:flutter/material.dart';
import 'component/main_header.dart';
import 'component/main_footer.dart';

class OtherReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MainHeader(),
          OtherReviewForm(),
          MainFooter(),
        ],
      ),
    );
  }
}

class OtherReviewForm extends StatefulWidget {
  @override
  _OtherReviewFormState createState() => _OtherReviewFormState();
}

class _OtherReviewFormState extends State<OtherReviewForm> {
  var ProfileContainer = [
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
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
