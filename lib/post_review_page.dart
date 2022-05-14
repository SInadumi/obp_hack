import 'package:flutter/material.dart';
import 'package:obp_hack/component/user_info.dart';
import 'component/main_header.dart';
import 'package:obp_hack/root_page.dart';

class PostPage extends StatelessWidget {
  PostPage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'post page',
      theme: ThemeData.light(),
      home: PostPageForm(),
    );
  }
}

class PostPageForm extends StatefulWidget {
  @override
  _PostPageFormState createState() => _PostPageFormState();
}

class _PostPageFormState extends State<PostPageForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostReviewPage(),
    );
  }
}

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
              SizedBox(height: 10),
              buildName(otheruser),
              SizedBox(height: 20),
              ProfileWidget(
                imagePath: otheruser.imagePath,
              ),
              SizedBox(height: 20),
              // TODO : 自分が書いたレビューのテキストを保持したい
              buildReview(myuser),
              SizedBox(height: 5),
              buildPostButton(),
              buildBackButton(),
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
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      );
  Widget buildReview(User2 user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Review',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              maxLength: 50,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
  Widget buildPostButton() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black.withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          onPressed: () {},
          child: Text(
            'Done!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
  Widget buildBackButton() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue.withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RootPage(),
              ),
            ),
          },
          child: Text(
            'Back',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
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
