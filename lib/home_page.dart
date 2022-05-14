import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'component/main_header.dart';
import 'component/main_footer.dart';
import 'component/user_info.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserInfomation userinfo = Provider.of<UserInfomation>(context);
    final User user = userinfo.user!;
    print(user.email);
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MainHeader(),
          HomeForm(),
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
  var user = [
    UserPreferences.myUser,
    UserPreferences.otherUser,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: PageView.builder(
          itemBuilder: (context, index) {
            return buildUserContainer(user[index]);
          },
          itemCount: user.length,
        ),
      ),
    );
  }

  Widget buildUserContainer(User2 user) => Container(
        child: Expanded(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                buildName(user),
                SizedBox(height: 20),
                ProfileWidget(
                  imagePath: user.imagePath,
                ),
                SizedBox(height: 20),
                buildReview(user),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
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
}

// 画像を表示するウィジェット
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
