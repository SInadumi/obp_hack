import 'package:flutter/material.dart';
import 'package:obp_hack/component/user_info.dart';
import 'component/main_header.dart';
import 'component/main_footer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  var myuser = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection(myuser.name).get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return ListView(
                children: documents.map((documents) {
                  return Card(
                    child: ListTile(
                      title: Text(documents['from']),
                      subtitle: Text(documents['text']),
                    ),
                  );
                }).toList(),
              );
            } else {
              return Center(
                child: Text('読込中...'),
              );
            }
          },
        ),
      ),
    );
  }
}
