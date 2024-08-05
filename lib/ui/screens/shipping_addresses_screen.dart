import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_addresses_list.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_profile_addresses.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ShippingAddressesScreen extends StatelessWidget {
  const ShippingAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(
        automaticallyImplyLeading: true,
        useSearchButton: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.kMainPaddingHorizontal.w,
          ),
          physics: const ClampingScrollPhysics(),
          children: [
            const TitleMain(
              title: AppStrings.addressesScreenTitle,
              icon: Icons.add,
              paddingHorizontal: 0,
            ),
            const VerticalListviewProfileAddresses(
              addressesList: dummyAddressesList,
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
