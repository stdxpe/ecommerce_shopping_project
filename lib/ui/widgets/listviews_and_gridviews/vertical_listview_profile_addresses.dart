import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_address_section.dart';

class VerticalListviewProfileAddresses extends StatelessWidget {
  const VerticalListviewProfileAddresses({super.key, required this.addresses});

  final List<Address> addresses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: addresses.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return TitleAddressSection(
          onPressed: () => context.push(Routes.bottomSheetAddresses,
              extra: addresses[index]),
          useTopDivider: index == 0 ? true : false,
          title: addresses[index].addressTitle,
          addressText: addresses[index].addressText,
          city: addresses[index].city,
          zipCode: addresses[index].zipCode,
          country: addresses[index].country,
        );
      },
    );
  }
}
