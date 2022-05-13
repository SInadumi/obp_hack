import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          PostHeader(),
          PostForm(),
          PostFooter(),
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

class PostFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text('this is footer'),
    );
  }
}

// class PostButton extends StatefulWidget {
//   @override
//   _PostButton createState() => _PostButton();
// }

// class _PostButton extends State<PostButton> {
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 24),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: Colors.black,
//           padding: EdgeInsets.symmetric(horizontal: 48),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//         ),
//         onPressed: () {},
//         child: Text('Done!', style: TextStyle(color: Colors.white)),
//       ),
//     );
//   }
// }
