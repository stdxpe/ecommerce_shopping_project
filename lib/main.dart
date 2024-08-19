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


// intl?
// basic_utils: ^5.7.0
// ColorUtils

// Helper class for color operations.

// int hexToInt(String hex);
// String intToHex(int i);
// String shadeColor(String hex, int percent);
// String fillUpHex(String hex);
///////////// bool isDark(String hex);

/// Catching All Errors in Top Level
  // https://stackoverflow.com/questions/57879455/flutter-catching-all-unhandled-exceptions

// Loading bars
// https://pub.dev/packages/loading_animation_widget
// https://pub.dev/packages/pinput

    /// flutter_dotenv: ^5.1.0
    /// All riverpod's starts at appstart while loading user??
    ///   AVOID initializing providers in a widget
    ///   Providers should initialize themselves.
    ///   They should not be initialized by an external element such as a widget.
    /// Eth will be in Collections. getCollection(id?)
    /// User Profile reviews section?
    /// TODO: Video BG Splash Screen
    /// TODO: Locally Cached Products will be in the Initial Data of Complex Providers or Dummys? Hive Boxes
 