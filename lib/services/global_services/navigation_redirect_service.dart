import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:go_router/go_router.dart';

final redirectRouteProvider =
    Provider.family<String?, GoRouterState>((ref, state) {
  var authService = locator<FirebaseAuth>();
  User? user = authService.currentUser;

  // return user == null ? Routes.splash : (state.matchedLocation);
  if (user == null && state.matchedLocation != Routes.splash) {
    return Routes.splash;
  }
  // else if (user == null && state.matchedLocation == Routes.splash) {
  //   return null;
  // } else if (user != null && state.matchedLocation != Routes.home) {
  //   return Routes.home;
  // } else if (user != null && state.matchedLocation == Routes.home) {
  //   return null;
  // }
});
