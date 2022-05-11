import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _WelcomeHeader(),
              _WelcomeForm(),
              _WelcomeFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 270;
    return Container(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text('LOGO'),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text('template text texmplate text template text'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WelcomeForm extends StatefulWidget {
  @override
  State<_WelcomeForm> createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<_WelcomeForm> {
  String email = '';
  String passward = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: 'メールアドレス'),
          onChanged: (String value) {
            setState(() {
              email = value;
            });
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'パスワード'),
          obscureText: true,
          onChanged: (String value) {
            setState(() {
              passward = value;
            });
          },
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            child: Text('ログイン'),
            onPressed: () async {
              try {
                print('成功した場合の処理の記述');
              } catch (e) {
                setState(() {
                  print('失敗した場合の処理の記述');
                });
              }
            },
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            child: Text('登録'),
            onPressed: () async {
              try {
                print('成功した場合の処理の記述');
              } catch (e) {
                setState(() {
                  print('失敗した場合の処理の記述');
                });
              }
            },
          ),
        ),
      ],
    );
  }
}

class _WelcomeFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('footer text'),
      ],
    );
  }
}
