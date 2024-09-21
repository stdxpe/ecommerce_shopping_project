import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_credit_card_section.dart';

class VerticalListviewProfileCreditCards extends ConsumerWidget {
  const VerticalListviewProfileCreditCards({super.key, required this.cards});

  final List<CreditCard> cards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: cards.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return TitleCreditCardSection(
          onPressed: () {
            ref.read(selectedCreditCardIndex.notifier).state = index;
            context.push(Routes.bottomSheetCreditCards);
          },
          useTopDivider: index == 0 ? true : false,
          cardHolder: cards[index].cardHolder,
          cardNumber: cards[index].cardNumber,
          validThru: cards[index].validThru,
        );
      },
    );
  }
}
