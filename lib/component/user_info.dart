import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfomation extends ChangeNotifier {
  User? user;
  void setUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}

// Test User Component
class User2 {
  final String imagePath;
  final String name;
  final String email;
  final String booktitle;
  final String review;

  const User2({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.booktitle,
    required this.review,
  });
}

// Test User Preferences
class UserPreferences {
  static const myUser = User2(
    imagePath:
        'https://images-na.ssl-images-amazon.com/images/I/41xyGT6vMcS._SX348_BO1,204,203,200_.jpg',
    name: 'Shun Inadumi',
    email: 'inadumi@gmail.com',
    booktitle: '三体',
    review: 'これを書いた人の知識はとんでもないなと思いながら読みました!これぞSFという感じがして、好きな小説です。',
  );

  static const otherUser = User2(
    imagePath:
        'https://images-na.ssl-images-amazon.com/images/I/71BjKgQp1+L.jpg',
    name: 'Ryoto Minami',
    email: 'minami@gmail.com',
    booktitle: '旅のラゴス',
    review: 'ドラゴンクエストⅤの元ネタになった小説らしいです。間違いなく名作です!',
  );

  static const otherUser2 = User2(
    imagePath:
        'https://t4.ftcdn.net/jpg/04/07/08/83/360_F_407088358_Te8jgvLhuGLTHGahkhuzWzd0uttgznVJ.jpg',
    name: 'Giovanni',
    email: 'giovanni@gmail.com',
    booktitle: '銀河鉄道の夜',
    review: 'オブジェクションの果てに喜劇役者のどんでん返し。賢治、お前ってやつは真の小説家だよ。',
  );
}
