// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAT940XiyPHiDPyjnsk0JtNPHWvr9m9Q-o',
    appId: '1:875684299064:web:9ceada2f609424740d01cd',
    messagingSenderId: '875684299064',
    projectId: 'bop-media-1',
    authDomain: 'bop-media-1.firebaseapp.com',
    storageBucket: 'bop-media-1.appspot.com',
    measurementId: 'G-XZY5NR061W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOcy6iMsIC1K60J7j1xFRCnis4Fg2-5sw',
    appId: '1:875684299064:android:ee9ac76563cd96270d01cd',
    messagingSenderId: '875684299064',
    projectId: 'bop-media-1',
    storageBucket: 'bop-media-1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAr89_r9zJDntBY1AvCCcr4Ba8U3sLBvA',
    appId: '1:875684299064:ios:f97166f1b873863f0d01cd',
    messagingSenderId: '875684299064',
    projectId: 'bop-media-1',
    storageBucket: 'bop-media-1.appspot.com',
    iosClientId: '875684299064-cairg9rjoov63ofl3sg2d4b3aknsqr7g.apps.googleusercontent.com',
    iosBundleId: 'com.example.obpHack',
  );
}
