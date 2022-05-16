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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB7H7n2FS_barDm8_kFvNgOjvmhlI1qfSw',
    appId: '1:415706202801:web:b12a3a0702c688794ed890',
    messagingSenderId: '415706202801',
    projectId: 'quizzle-15365',
    authDomain: 'quizzle-15365.firebaseapp.com',
    storageBucket: 'quizzle-15365.appspot.com',
    measurementId: 'G-0NCHHHHJSC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7QQslItaPsLGY3eBf_GR0-ShGLKovDfY',
    appId: '1:415706202801:android:72d65db218eb2e014ed890',
    messagingSenderId: '415706202801',
    projectId: 'quizzle-15365',
    storageBucket: 'quizzle-15365.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl-HpZdxZayLftVP4YyKRMvTvlkXF32g0',
    appId: '1:415706202801:ios:4c309483517e9e5e4ed890',
    messagingSenderId: '415706202801',
    projectId: 'quizzle-15365',
    storageBucket: 'quizzle-15365.appspot.com',
    iosClientId: '415706202801-1m1sgfir0rt3ltodth4nrqi13bm0j030.apps.googleusercontent.com',
    iosBundleId: 'com.codefox.quizzle',
  );
}