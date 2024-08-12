import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/titles/title_payment_summary_section.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class VerticalListviewProfileCreditCards extends StatelessWidget {
  const VerticalListviewProfileCreditCards({
    super.key,
    required this.cardsList,
  });

  final List cardsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: cardsList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return TitlePaymentSummarySection(
            onPressed: () {},
            useTopDivider: true,
            textButtonText: AppStrings.creditCardsScreenSectionEditButton,
            title: cardsList[index]['cardTitle'],
            subtext: '${cardsList[index]['cardNumber']}');
      },
    );
  }
}
