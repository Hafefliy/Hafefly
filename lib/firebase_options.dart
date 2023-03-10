// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDdXLCmntF18sSMJq9kYc4JGQd6ZlqulC0',
    appId: '1:581118858705:web:fd64ed9c0aa9035752fcf0',
    messagingSenderId: '581118858705',
    projectId: 'hafefly-android',
    authDomain: 'hafefly-android.firebaseapp.com',
    databaseURL: 'https://hafefly-android-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hafefly-android.appspot.com',
    measurementId: 'G-EZ347893MM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQpgzlVagJEBjfu7ZDe-XFWd82kE35Xhc',
    appId: '1:581118858705:android:cb3fb03a6c7e03d052fcf0',
    messagingSenderId: '581118858705',
    projectId: 'hafefly-android',
    databaseURL: 'https://hafefly-android-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hafefly-android.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaclt4-LRbB7PlRls3WSsDBE4NWEeWJnw',
    appId: '1:581118858705:ios:fd4a3cf1bbf0edcf52fcf0',
    messagingSenderId: '581118858705',
    projectId: 'hafefly-android',
    databaseURL: 'https://hafefly-android-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hafefly-android.appspot.com',
    iosClientId: '581118858705-6kaqdpv0p7q835i6ijmla51g8i20qc0l.apps.googleusercontent.com',
    iosBundleId: 'com.raynmore.hafefly',
  );
}
