import 'package:ecommerce_shopping_project/utilities/system_chrome_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_shopping_project/utilities/app_configuration.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setDeviceOrientationToPortraitModeOnly();
  setDependencyInjection();
  runApp(
    const ProviderScope(
      child: RootApp(),
    ),
  );
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppConfiguration();
  }
}

// Loading bars
// https://pub.dev/packages/loading_animation_widget
// https://pub.dev/packages/pinput


    /// 'Your wishlist/cart is empty' widget
    /// All riverpod's starts at appstart while loading user??
    ///   AVOID initializing providers in a widget
    ///   Providers should initialize themselves.
    ///   They should not be initialized by an external element such as a widget.
    /// Eth will be in Collections. getCollection(id?)
    /// User Profile reviews section?
    /// TODO: TEXTFIELDS and Regex Validations
    /// TODO: Video BG Splash Screen
    /// TODO: Locally Cached Products will be in the Initial Data of Complex Providers or Dummys?
 