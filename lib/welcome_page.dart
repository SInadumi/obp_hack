import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:obp_hack/root_page.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:obp_hack/component/user_info.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WelcomeHeader(),
              WelcomeForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = 300;
    return Container(
      height: height,
      child: Padding(
        padding: EdgeInsets.only(top: 90),
        child: Column(
          children: [
            Image.asset('assets/logo_middle_size.png'),
          ],
        ),
      ),
    );
  }
}

class WelcomeForm extends StatefulWidget {
  @override
  _WelcomeFormState createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final UserInfomation userinfo = Provider.of<UserInfomation>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // メールアドレス入力
        TextFormField(
          decoration: InputDecoration(labelText: 'メールアドレス'),
          onChanged: (String value) {
            setState(() {
              email = value;
            });
          },
        ),
        // パスワード入力
        TextFormField(
          decoration: InputDecoration(labelText: 'パスワード'),
          obscureText: true,
          onChanged: (String value) {
            setState(() {
              password = value;
            });
          },
        ),
        Container(
          padding: EdgeInsets.all(8),
          // メッセージ表示
          child: Text(infoText),
        ),
        Container(
          width: double.infinity,
          // ユーザー登録ボタン
          child: ElevatedButton(
            child: Text('ユーザー登録'),
            onPressed: () async {
              try {
                // メール/パスワードでユーザー登録
                final FirebaseAuth auth = FirebaseAuth.instance;
                final result = await auth.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                // ユーザ情報を更新
                userinfo.setUser(result.user!);
                // ユーザー登録に成功した場合
                // チャット画面に遷移＋ログイン画面を破棄
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return RootPage();
                  }),
                );
              } catch (e) {
                // ユーザー登録に失敗した場合
                setState(() {
                  infoText = "登録に失敗しました：${e.toString()}";
                });
              }
            },
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          // ログイン登録ボタン
          child: OutlinedButton(
            child: Text('ログイン'),
            onPressed: () async {
              try {
                // メール/パスワードでログイン
                final FirebaseAuth auth = FirebaseAuth.instance;
                final result = await auth.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                userinfo.setUser(result.user!);
                // ログインに成功した場合
                // チャット画面に遷移＋ログイン画面を破棄
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return RootPage();
                  }),
                );
              } catch (e) {
                // ログインに失敗した場合
                setState(() {
                  infoText = "ログインに失敗しました：${e.toString()}";
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
