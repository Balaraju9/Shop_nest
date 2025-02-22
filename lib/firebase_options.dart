// File generated by FlutterFire CLI.
// ignore_for_file: type=lint

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
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
    apiKey: 'AIzaSyDZFJ8hEwkmoD4eMMt0APhq-fhwVrt2Nyg',
    appId: '1:130713832188:web:6a55b735b3386c3bb52579',
    messagingSenderId: '130713832188',
    projectId: 'device-streaming-bfda7862',
    authDomain: 'device-streaming-bfda7862.firebaseapp.com',
    storageBucket: 'device-streaming-bfda7862.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt2FoI5N2D9dkxFDXG5W4sjskvyICE4GA',
    appId: '1:130713832188:android:b5787f5534084408b52579',
    messagingSenderId: '130713832188',
    projectId: 'device-streaming-bfda7862',
    storageBucket: 'device-streaming-bfda7862.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcO8CLaiHfob4hEKOdpMbpfgm_Q-ajtBA',
    appId: '1:130713832188:ios:2ee59a2955fabffeb52579',
    messagingSenderId: '130713832188',
    projectId: 'device-streaming-bfda7862',
    storageBucket: 'device-streaming-bfda7862.appspot.com',
    iosBundleId: 'com.example.shopnestDart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcO8CLaiHfob4hEKOdpMbpfgm_Q-ajtBA',
    appId: '1:130713832188:ios:2ee59a2955fabffeb52579',
    messagingSenderId: '130713832188',
    projectId: 'device-streaming-bfda7862',
    storageBucket: 'device-streaming-bfda7862.appspot.com',
    iosBundleId: 'com.example.shopnestDart',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDZFJ8hEwkmoD4eMMt0APhq-fhwVrt2Nyg',
    appId: '1:130713832188:web:578c06a4b37a521fb52579',
    messagingSenderId: '130713832188',
    projectId: 'device-streaming-bfda7862',
    authDomain: 'device-streaming-bfda7862.firebaseapp.com',
    storageBucket: 'device-streaming-bfda7862.appspot.com',
  );
}
