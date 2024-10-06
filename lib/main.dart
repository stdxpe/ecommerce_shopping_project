import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:ecommerce_shopping_project/app_configuration.dart';
import 'package:ecommerce_shopping_project/firebase_options.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/stripe_payment_service.dart';
import 'package:ecommerce_shopping_project/utilities/system_chrome_setup.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Remove Print Ignore in analysis_options.yaml

  /// GetIt Implemented as Dependency Injection Solution
  initializeDependencyInjectionService();

  /// DotEnv Implemented as Environment Variable Solution
  await dotenv.load(fileName: Constants.envPath);

  /// Device Screen Orientation Set to Portrait Mode
  setDeviceOrientation();

  /// Firebase Implemented as Cloud Solution
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Hive Implemented as Local Storage Service
  await Hive.initFlutter();
  await Hive.openBox(LocalDB.path);

  /// Stripe Implemented as Payment Service
  StripePaymentService.initialize();

  runApp(
    /// Riverpod Implemented as State Management Solution
    const ProviderScope(child: RootApp()),
  );
}






/// Catching All Errors in Top Level
  // https://stackoverflow.com/questions/57879455/flutter-catching-all-unhandled-exceptions


// https://pub.dev/packages/pinput

    /// All riverpod's starts at appstart while loading user??
    ///   AVOID initializing providers in a widget
    ///   Providers should initialize themselves.
    ///   They should not be initialized by an external element such as a widget.

    /// TODO: Discover Screen - New Collections
    /// TODO: Logo and Splash Screen
    /// TODO: Video BG Splash Screen

    /// TODO: Learn how to move HEAD tag inside VSCode
    /// TODO: Divided Provider States
    /// TODO: Internet Connection Check On Start
    /// TODO: SMS or Email Verification
    /// Firebase Rules: Write only users collection, non-other
    /// FINAL REFACTOR
    /// Final Commit Message Adjustments
    /// Push to Release Branch
 