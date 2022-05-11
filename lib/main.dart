import 'package:flutter/material.dart';
import 'package:obp_hack/welcome_page.dart';

void main() {
  runApp(Read1erApp());
}

class Read1erApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: WelcomePage(),
    );
  }
}
