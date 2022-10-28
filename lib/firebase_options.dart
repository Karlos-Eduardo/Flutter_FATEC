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
    apiKey: 'AIzaSyCO8_UL6SiWRYFznGd-C_DxFMgLHMK0eZk',
    appId: '1:767513700559:web:7fa77f0dacae6f58732fba',
    messagingSenderId: '767513700559',
    projectId: 'app-agni-7cbe5',
    authDomain: 'app-agni-7cbe5.firebaseapp.com',
    storageBucket: 'app-agni-7cbe5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmYGnOQHgwgeVuiVDRAJSGxh0P4ymSj3Q',
    appId: '1:767513700559:android:9f77fc07a7ae2b8e732fba',
    messagingSenderId: '767513700559',
    projectId: 'app-agni-7cbe5',
    storageBucket: 'app-agni-7cbe5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6xZ6io60A0V8pZ5QckbB1D0jsMZu_OMg',
    appId: '1:767513700559:ios:08f9e77b1d3d9240732fba',
    messagingSenderId: '767513700559',
    projectId: 'app-agni-7cbe5',
    storageBucket: 'app-agni-7cbe5.appspot.com',
    iosClientId: '767513700559-r6fc6hsl2p0nvrtpn55h03do25p0snqg.apps.googleusercontent.com',
    iosBundleId: 'com.example.appAgni',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6xZ6io60A0V8pZ5QckbB1D0jsMZu_OMg',
    appId: '1:767513700559:ios:08f9e77b1d3d9240732fba',
    messagingSenderId: '767513700559',
    projectId: 'app-agni-7cbe5',
    storageBucket: 'app-agni-7cbe5.appspot.com',
    iosClientId: '767513700559-r6fc6hsl2p0nvrtpn55h03do25p0snqg.apps.googleusercontent.com',
    iosBundleId: 'com.example.appAgni',
  );
}