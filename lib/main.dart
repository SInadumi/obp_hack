import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:obp_hack/welcome_page.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:obp_hack/root_page.dart';
import 'package:provider/provider.dart';
import 'package:obp_hack/component/user_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 最初に表示するWidget
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserInfomation>(
      create: (context) => UserInfomation(),
      child: MaterialApp(
        // アプリ名
        title: 'ChatApp',
        theme: ThemeData(
          // テーマカラー
          primarySwatch: Colors.blue,
        ),
        // ログイン画面を表示
        home: WelcomePage(),
      ),
    );
  }
}
