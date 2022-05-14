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
  final bool isDarkMode;

  const User2({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.booktitle,
    required this.review,
    required this.isDarkMode,
  });
}

// Test User Preferences
class UserPreferences {
  static const myUser = User2(
    imagePath: 'https://illustimage.com/photo/dl/2503.png?20161226',
    name: 'Shun Inadumi',
    email: 'inadumi@gmail.com',
    booktitle: '1Q84',
    review:
        'test review test review test review test reviewtest review test review test review test reviewtest review',
    isDarkMode: false,
  );

  static const otherUser = User2(
    imagePath: 'https://illustimage.com/photo/2504.png?20161226',
    name: 'Ryoto Minami',
    email: 'minami@gmail.com',
    booktitle: '旅のラゴス',
    review:
        'test review test review test review test reviewtest review test review test review test reviewtest review',
    isDarkMode: false,
  );
}
