import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

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
            'This app have not been configured for macOS yet');
      case TargetPlatform.windows:
        throw UnsupportedError(
            'This app have not been configured for Windows yet');
      case TargetPlatform.linux:
        throw UnsupportedError(
            'This app have not been configured for Linux yet');

      default:
        throw UnsupportedError(
            'This app have not been configured for this platform yet');
    }
  }

  /// About exposing to Firebase Keys to public:
  ///
  /// From the Firebase documentation on using and managing API keys:
  ///   "Firebase-related APIs use API keys only to identify the Firebase project or app,
  ///   not for authorization to call the API (like some other APIs allow)"
  ///
  /// Therefore, this firebase_options.dart file has not registered into the .gitignore file

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALyqtamzCaooPQbnl7raYtruL-Yl1usrA',
    appId: '1:970016209623:web:07e10e452f7f830f854e92',
    messagingSenderId: '970016209623',
    projectId: 'ecommerce-shopping-project',
    authDomain: 'ecommerce-shopping-project.firebaseapp.com',
    storageBucket: 'ecommerce-shopping-project.appspot.com',
    measurementId: 'G-GR1LBV75N8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1LAW063QjVAOfTaLWVroN6M5yPfdUr9I',
    appId: '1:970016209623:android:f20cb45e22eb8206854e92',
    messagingSenderId: '970016209623',
    projectId: 'ecommerce-shopping-project',
    storageBucket: 'ecommerce-shopping-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmjZdRVb4pw_UiFjd0zlrZgWCKMYF2884',
    appId: '1:970016209623:ios:fb8a66257886188d854e92',
    messagingSenderId: '970016209623',
    projectId: 'ecommerce-shopping-project',
    storageBucket: 'ecommerce-shopping-project.appspot.com',
    iosBundleId: 'com.yasinbilgin.ecommerceShoppingProject',
  );
}
