import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/cards/profile_card_button.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/profile_card_user_info.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_cupertino_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:unicons/unicons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    this.isDarkModeEnabled = false,
    this.onDarkModeEnabled,
  });

  final Function()? onDarkModeEnabled;
  final bool? isDarkModeEnabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(
        automaticallyImplyLeading: false,
        useSearchButton: false,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            const ProfileCardUserInfo(
              username: 'Jane Doe',
              email: 'verified@gmail.com',
              phoneNumber: '555 545342',
              profilePhoto: AppImages.productImage10,
              cardHeight: 225,
            ),
            SizedBox(height: 30.h),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemOrders,
              // icon: Icons.shopping_bag_outlined,
              icon: UniconsLine.shopping_bag,
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemAddresses,
              // icon: Icons.location_on,
              icon: UniconsLine.location_pin_alt,
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemCreditCards,
              // icon: Icons.credit_card,
              icon: UniconsLine.credit_card,
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemDarkMode,
              // icon: CupertinoIcons.moon_fill,
              icon: UniconsLine.moon,
              widgetContent: SwitchCupertinoCustom(
                  switchState: isDarkModeEnabled,
                  onChanged: (boolValue) {
                    /// TODO: Theme Mode selection change globally.
                    onDarkModeEnabled!();
                  }),
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemNotifications,
              icon: TablerIcons.notification,
              widgetContent: SwitchCupertinoCustom(
                  switchState: true, onChanged: (boolValue) {}),
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemChangePassword,
              // icon: Icons.password_outlined,
              icon: TablerIcons.password_fingerprint,
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemAboutUs,
              icon: TablerIcons.code,
            ),
            ProfileCardButton(
              onPressed: () {},
              buttonText: AppStrings.profileScreenButtonsListItemSignOut,
              icon: TablerIcons.logout,
              useBottomDivider: true,
            ),
            // SwitchCupertinoCustom(onChanged: () {}),
          ],
        ),
      ),
    );
  }
}
