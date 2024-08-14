import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/app_configuration.dart';
import 'package:ecommerce_shopping_project/firebase_options.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/utilities/system_chrome_setup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setDeviceOrientationToPortraitModeOnly();
  registerDependencyInjectionService();

  /// Firebase Implemented as Cloud Solution
  initializeFirebase();

  runApp(
    /// Riverpod Implemented as State Management Solution
    const ProviderScope(
      child: RootApp(),
    ),
  );
}

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
 