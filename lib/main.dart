import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:ecommerce_shopping_project/app_configuration.dart';
import 'package:ecommerce_shopping_project/firebase_options.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/utilities/system_chrome_setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setDeviceOrientationToPortraitModeOnly();
  registerDependencyInjectionService();

  /// Firebase Implemented as Cloud Solution
  initializeFirebase();
  await Firebase.initializeApp();
  runApp(
    /// Riverpod Implemented as State Management Solution
    const ProviderScope(
      child: RootApp(),
    ),
    // TODO: Remove Print Ignore in analysis_options.yaml
  );
}






/// Catching All Errors in Top Level
  // https://stackoverflow.com/questions/57879455/flutter-catching-all-unhandled-exceptions


// https://pub.dev/packages/pinput

    /// flutter_dotenv: ^5.1.0
    /// All riverpod's starts at appstart while loading user??
    ///   AVOID initializing providers in a widget
    ///   Providers should initialize themselves.
    ///   They should not be initialized by an external element such as a widget.

    /// Banners on Home & DB
    /// User Profile reviews section?
    /// TODO: Create Reviews
    /// TODO: Video BG Splash Screen
    /// TODO: Hive for saving theme.mode and notification.selection only no-more yet
 