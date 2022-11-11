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
    apiKey: 'AIzaSyDsDxSw9FyK_VMhfwI25WiPkLczUdtz5qI',
    appId: '1:126600659059:web:05c9d96783c0389daaaa06',
    messagingSenderId: '126600659059',
    projectId: 'loja-online-1be31',
    authDomain: 'loja-online-1be31.firebaseapp.com',
    storageBucket: 'loja-online-1be31.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA28xXQJF94cr68aWjJMoisf9M3WVjSdE',
    appId: '1:126600659059:android:9f53fbee56a00c74aaaa06',
    messagingSenderId: '126600659059',
    projectId: 'loja-online-1be31',
    storageBucket: 'loja-online-1be31.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1OgDIBoEZq6c8JxglVV32XlEs5tr9NaU',
    appId: '1:126600659059:ios:efdfdde429e9a89faaaa06',
    messagingSenderId: '126600659059',
    projectId: 'loja-online-1be31',
    storageBucket: 'loja-online-1be31.appspot.com',
    iosClientId: '126600659059-44e6euf86ruf1nhal084tguhe6htlkeg.apps.googleusercontent.com',
    iosBundleId: 'com.example.desafioApirest',
  );
}