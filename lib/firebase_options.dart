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
    apiKey: 'AIzaSyBjY6eB2pYgL8xWqCDkUPsW_mhImeGjJ24',
    appId: '1:361264260434:web:e3c729d8b8945f3134c68b',
    messagingSenderId: '361264260434',
    projectId: 'csic-app-2c303',
    authDomain: 'csic-app-2c303.firebaseapp.com',
    databaseURL: 'https://csic-app-2c303.firebaseio.com',
    storageBucket: 'csic-app-2c303.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjyPEDXJkrpWI8-vA1ZMU_SAdbJnkOL30',
    appId: '1:361264260434:android:8896982086e8059534c68b',
    messagingSenderId: '361264260434',
    projectId: 'csic-app-2c303',
    databaseURL: 'https://csic-app-2c303.firebaseio.com',
    storageBucket: 'csic-app-2c303.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnGC6ht3MQYCOD5mov6EfoOWmVuPriHPs',
    appId: '1:361264260434:ios:4bcde22545a120d934c68b',
    messagingSenderId: '361264260434',
    projectId: 'csic-app-2c303',
    databaseURL: 'https://csic-app-2c303.firebaseio.com',
    storageBucket: 'csic-app-2c303.appspot.com',
    androidClientId: '361264260434-8paovhor81qltgdsc8vgc8qocukg9c7k.apps.googleusercontent.com',
    iosClientId: '361264260434-ajcav12evbj4cnanb3cj6pih1e2d5qgc.apps.googleusercontent.com',
    iosBundleId: 'com.example.attendanceMontior',
  );
}
