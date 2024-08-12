import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/titles/title_payment_summary_section.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class VerticalListviewProfileAddresses extends StatelessWidget {
  const VerticalListviewProfileAddresses({
    super.key,
    required this.addressesList,
  });

  final List addressesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: addressesList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return TitlePaymentSummarySection(
          onPressed: () {},
          useTopDivider: true,
          textButtonText: AppStrings.addressesScreenSectionEditButton,
          title: addressesList[index]['addressTitle'],
          subtext: addressesList[index]['address'],
        );
      },
    );
  }
}
