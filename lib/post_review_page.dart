import 'package:flutter/material.dart';
import 'component/main_header.dart';
import 'component/main_footer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MainHeader(),
          PostReviewForm(),
          PostButton(),
          MainFooter(),
        ],
      ),
    );
  }
}

class PostReviewForm extends StatefulWidget {
  @override
  _PostReviewFormState createState() => _PostReviewFormState();
}

class _PostReviewFormState extends State<PostReviewForm> {
  var ProfileContainer = [
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.yellow,
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
