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
        return macos;
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
    apiKey: 'AIzaSyAh38n-IHCjd7_ipfzRY1VUNMk8Jq9aJj4',
    appId: '1:480967877649:web:e3e451f970c681b259fdb0',
    messagingSenderId: '480967877649',
    projectId: 'notes-f6817',
    authDomain: 'notes-f6817.firebaseapp.com',
    storageBucket: 'notes-f6817.appspot.com',
    measurementId: 'G-YLVFSP3Y6G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5547oR6y7OqDpjtvGX5VXvEyZ6HRB820',
    appId: '1:480967877649:android:3fcbcd50f50fbeed59fdb0',
    messagingSenderId: '480967877649',
    projectId: 'notes-f6817',
    storageBucket: 'notes-f6817.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhjyFkLq7-E-LiyGViLChAHkEzbew8IZY',
    appId: '1:480967877649:ios:d04da97e2716fe1359fdb0',
    messagingSenderId: '480967877649',
    projectId: 'notes-f6817',
    storageBucket: 'notes-f6817.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhjyFkLq7-E-LiyGViLChAHkEzbew8IZY',
    appId: '1:480967877649:ios:5beadedbc25a986059fdb0',
    messagingSenderId: '480967877649',
    projectId: 'notes-f6817',
    storageBucket: 'notes-f6817.appspot.com',
    iosBundleId: 'com.example.notes.RunnerTests',
  );
}
