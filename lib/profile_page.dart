import 'package:flutter/material.dart';
import 'component/main_header.dart';
import 'component/main_footer.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MainHeader(),
          ProfileForm(),
          PostButton(),
          MainFooter(),
        ],
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
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
      padding: EdgeInsets.symmetric(vertical: 12),
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
