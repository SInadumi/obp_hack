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
    imagePath:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Shun Inadumi',
    email: 'inadumi@gmail.com',
    booktitle: '1Q84',
    review:
        'test review test review test review test reviewtest review test review test review test reviewtest review',
    isDarkMode: false,
  );
}
