import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/notifications_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/theme_mode_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/user_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/profile_card_button.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/profile_card_user_info.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_cupertino_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel userModel = ref.watch(userProvider).value!;

    return Scaffold(
      appBar: const AppBarMain(
        automaticallyImplyLeading: false,
        useSearchButton: false,
        appBarHeight: 30,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            ProfileCardUserInfo(
              onPressed: () => context.push(Routes.bottomSheetProfileEdit),
              username: userModel.username,
              email: userModel.email,
              phoneNumber: userModel.phone,
              profilePhoto: userModel.photo,
              cardHeight: 225,
            ),
            SizedBox(height: 30.h),
            ProfileCardButton(
              onPressed: () => context.push(Routes.orders),
              buttonText: AppStrings.profileScreenButtonsListItemOrders,
              icon: UniconsLine.shopping_bag,
            ),
            ProfileCardButton(
              onPressed: () => context.push(Routes.shippingAddresses),
              buttonText: AppStrings.profileScreenButtonsListItemAddresses,
              icon: UniconsLine.location_pin_alt,
            ),
            ProfileCardButton(
              onPressed: () => context.push(Routes.creditCards),
              buttonText: AppStrings.profileScreenButtonsListItemCreditCards,
              icon: UniconsLine.credit_card,
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemDarkMode,
              icon: UniconsLine.moon,
              widgetContent: SwitchCupertinoCustom(
                  switchState: ref.watch(isDarkModeOn),
                  onChanged: () => ref.read(themeMode.notifier).toggleTheme()),
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemNotifications,
              icon: TablerIcons.notification,
              widgetContent: SwitchCupertinoCustom(
                  switchState: ref.watch(notifications),
                  onChanged: () {
                    ref.read(notifications.notifier).toggleSwitch();
                  }),
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemChangePassword,
              icon: TablerIcons.password_fingerprint,
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemAboutUs,
              icon: TablerIcons.code,
            ),
            ProfileCardButton(
              onPressed: () => ref.read(userProvider.notifier).signOut(),
              buttonText: AppStrings.profileScreenButtonsListItemSignOut,
              icon: TablerIcons.logout,
              useBottomDivider: true,
            ),
            SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
          ],
        ),
      ),
    );
  }
}
