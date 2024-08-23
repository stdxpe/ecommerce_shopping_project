import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/firebase/firebase_user_provider.dart';

final navigationRedirectProvider =
    Provider.family<String?, GoRouterState>((ref, state) {
  bool? isAuthenticated = false;
  ref.watch(userProvider).whenData(
      (userModel) => isAuthenticated = (userModel != null) ? true : false);
  bool isLoading = ref.watch(userProvider).isLoading;

  print('redirectService | isAuthenticated: $isAuthenticated');

  bool subloc(String route) => state.matchedLocation == route;
  // if (isAuthenticated == null) return Routes.loading;
  if (isAuthenticated == false && isLoading) return Routes.loading;
  if (isAuthenticated == true) {
    if (subloc(Routes.loading)) return Routes.home;
    if (subloc(Routes.splash)) return Routes.home;
    if (subloc(Routes.onboarding)) return Routes.home;
    if (subloc(Routes.signIn)) return Routes.home;
    if (subloc(Routes.signUp)) return Routes.home;
    if (subloc(Routes.forgotPassword)) return Routes.home;
    if (subloc(Routes.verification)) return Routes.home;
    return null;
  } else if (isAuthenticated == false) {
    if (subloc(Routes.profile)) return Routes.loading;
    if (subloc(Routes.loading)) return Routes.splash;
    if (subloc(Routes.splash)) return Routes.splash;
    if (subloc(Routes.onboarding)) return Routes.onboarding;
    if (subloc(Routes.signIn)) return Routes.signIn;
    if (subloc(Routes.signUp)) return Routes.signUp;
    if (subloc(Routes.forgotPassword)) return Routes.forgotPassword;
    if (subloc(Routes.verification)) return Routes.verification;
  }
  return null;
});
