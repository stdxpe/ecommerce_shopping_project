import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/profile_card_button.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/profile_card_user_info.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_cupertino_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(),
      body: ListView(
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
          const ProfileCardButton(
            buttonText: AppStrings.profileScreenButtonsListItemOrders,
            icon: Icons.shopping_bag_outlined,
          ),
          const ProfileCardButton(
            buttonText: AppStrings.profileScreenButtonsListItemAddresses,
            icon: Icons.location_on,
          ),
          const ProfileCardButton(
            buttonText: AppStrings.profileScreenButtonsListItemCreditCards,
            icon: Icons.credit_card,
          ),
          ProfileCardButton(
            buttonText: AppStrings.profileScreenButtonsListItemDarkMode,
            widgetContent:
                SwitchCupertinoCustom(switchState: false, onChanged: () {}),
            icon: CupertinoIcons.moon_fill,
          ),
          ProfileCardButton(
            buttonText: AppStrings.profileScreenButtonsListItemNotifications,
            icon: Icons.notifications,
            widgetContent:
                SwitchCupertinoCustom(switchState: true, onChanged: () {}),
          ),
          const ProfileCardButton(
            buttonText: AppStrings.profileScreenButtonsListItemChangePassword,
            icon: Icons.password_outlined,
          ),
          const ProfileCardButton(
            buttonText: AppStrings.profileScreenButtonsListItemAboutUs,
            icon: Icons.question_mark,
          ),
          const ProfileCardButton(
            buttonText: AppStrings.profileScreenButtonsListItemSignOut,
            icon: Icons.logout,
            useBottomDivider: true,
          ),
          // SwitchCupertinoCustom(onChanged: () {}),
        ],
      ),
    );
  }
}
