import 'package:flutter/material.dart';
import 'package:obp_hack/component/user_info.dart';
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
  @override
  Widget build(BuildContext context) {
    final myuser = UserPreferences.myUser;
    final otheruser = UserPreferences.otherUser;
    return Container(
      child: Expanded(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              buildName(otheruser),
              SizedBox(height: 20),
              ProfileWidget(
                imagePath: otheruser.imagePath,
              ),
              SizedBox(height: 20),
              // TODO : 自分が書いたレビューのテキストを保持したい
              buildReview(myuser),
              SizedBox(height: 10),
              postButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User2 user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );
  Widget buildReview(User2 user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.booktitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.review,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
  Widget postButton() => Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black.withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          onPressed: () {},
          child: Text('Done!', style: TextStyle(color: Colors.white)),
        ),
      );
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

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  const ProfileWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);
    return Container(
      width: 256,
      height: 256,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(10, 10),
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
          ),
          BoxShadow(
            offset: Offset(-10, -10),
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 256,
            height: 256,
          ),
        ),
      ),
    );
  }
}
