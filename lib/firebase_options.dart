// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCgT-E7I74Z9fwqC1YUjXUufzhX4mgQ9sk',
    appId: '1:618824441160:web:009eb2ac27e5f3fe82e77d',
    messagingSenderId: '618824441160',
    projectId: 'fooddeliveryapp-6b273',
    authDomain: 'fooddeliveryapp-6b273.firebaseapp.com',
    storageBucket: 'fooddeliveryapp-6b273.appspot.com',
    measurementId: 'G-1L3HG8T0GD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_5fKG6MQ4xOFsuj3GiKtu7QPhBW-TUQY',
    appId: '1:618824441160:android:436b56d1a6f3e1c182e77d',
    messagingSenderId: '618824441160',
    projectId: 'fooddeliveryapp-6b273',
    storageBucket: 'fooddeliveryapp-6b273.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCa8lA6vTjyriqMj7b2V43ZHk2uUuXwkr0',
    appId: '1:618824441160:ios:b0ce66e8348436fe82e77d',
    messagingSenderId: '618824441160',
    projectId: 'fooddeliveryapp-6b273',
    storageBucket: 'fooddeliveryapp-6b273.appspot.com',
    iosBundleId: 'com.example.fooddeliveryapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCa8lA6vTjyriqMj7b2V43ZHk2uUuXwkr0',
    appId: '1:618824441160:ios:b0ce66e8348436fe82e77d',
    messagingSenderId: '618824441160',
    projectId: 'fooddeliveryapp-6b273',
    storageBucket: 'fooddeliveryapp-6b273.appspot.com',
    iosBundleId: 'com.example.fooddeliveryapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCgT-E7I74Z9fwqC1YUjXUufzhX4mgQ9sk',
    appId: '1:618824441160:web:9e6930ae3d6ea0e482e77d',
    messagingSenderId: '618824441160',
    projectId: 'fooddeliveryapp-6b273',
    authDomain: 'fooddeliveryapp-6b273.firebaseapp.com',
    storageBucket: 'fooddeliveryapp-6b273.appspot.com',
    measurementId: 'G-YQ7LXKZ2FZ',
  );
}

//change googlejson file manually by donwnloading from site
//change compilesdk version 34 && minsdk version 23
//flutter clean,flutter pub get,flutter run