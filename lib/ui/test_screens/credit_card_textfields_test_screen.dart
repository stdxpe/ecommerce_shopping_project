// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:ecommerce_shopping_project/models/credit_card.dart';
// import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';
// import 'package:ecommerce_shopping_project/ui/widgets/sliders/credit_cards_slider.dart';
// import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
// import 'package:ecommerce_shopping_project/utilities/k_credit_card_input_formatters.dart';
// import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

// class CreditCardTextfieldsTestScreen extends ConsumerStatefulWidget {
//   const CreditCardTextfieldsTestScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _CreditCardTextfieldsTestScreenState();
// }

// class _CreditCardTextfieldsTestScreenState
//     extends ConsumerState<CreditCardTextfieldsTestScreen> {
//   FocusNode cvvFocusNode = FocusNode();
//   CreditCard? initialCard;

//   // @override
//   // void didChangeDependencies() {
//   //   ref.watch(textControllerCreditCardTest).addListener(() => setState(() {}));
//   //   super.didChangeDependencies();
//   // }

//   // @override
//   // void initState() {
//   //   cvvFocusNode.addListener(() => setState(() {}));
//   //   ref.read(textControllerCreditCardTest).addListener(() => setState(() {}));
//   //   ref
//   //       .read(textControllerCreditCardHolder(initialCard?.cardHolder))
//   //       .addListener(() => setState(() {}));
//   //   ref
//   //       .read(textControllerCreditCardNumber(initialCard?.cardNumber))
//   //       .addListener(() => setState(() {}));
//   //   ref
//   //       .read(textControllerCreditCardValidThru(initialCard?.validThru))
//   //       .addListener(() => setState(() {}));
//   //   ref
//   //       .read(textControllerCreditCardCvv(initialCard?.cvv))
//   //       .addListener(() => setState(() {}));
//   //   super.initState();
//   // }

//   @override
//   void dispose() {
//     cvvFocusNode.dispose();
//     // ref.read(creditCardsProvider.notifier).disposeControllers();
//     // ref.read(textControllerCreditCardHolder(initialCard?.cardHolder)).dispose();
//     // ref.read(textControllerCreditCardNumber(initialCard?.cardNumber)).dispose();
//     // ref
//     //     .read(textControllerCreditCardValidThru(initialCard?.validThru))
//     //     .dispose();
//     // ref.read(textControllerCreditCardCvv(initialCard?.cvv)).dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     initialCard = ref.watch(selectedCreditCard);
//     var controller = ref.watch(creditCardTextControllers);

//     return Scaffold(
//       backgroundColor: Colors.red,
//       body: ListView(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         children: [
//           // CreditCardsSlider(
//           //   isCvvFocused: cvvFocusNode.hasFocus || cvvFocusNode.hasPrimaryFocus,
//           // ),
//           // Text(ref.watch(textControllerCreditCardTest).text),
//           // TextformfieldMain(
//           //   onChanged: (value) {
//           //     ref.read(textControllerCreditCardTest).text = value;
//           //     setState(() {});
//           //     // ref.read(textControllerCreditCardTest.notifier).state.text =
//           //     //     value;

//           //     print(ref.read(textControllerCreditCardTest).text);
//           //   },
//           //   controller: ref.watch(textControllerCreditCardTest),
//           //   inputFormatters: [
//           //     CreditCardHolderFormatter(),
//           //     FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
//           //   ],
//           //   textInputAction: TextInputAction.next,
//           //   hintText: AppStrings.paymentScreenCreditCardTextField1,
//           // ),
//           SizedBox(height: 50.h),
//           TextformfieldMain(
//             onChanged: (value) {
//               ref.read(creditCardTextControllers).cardHolder.text = value;
//               // ref
//               //     .read(textControllerCreditCardHolder(initialCard?.cardHolder))
//               //     .text = value;
//               // setState(() {});

//               // setState(() {});
//             },
//             controller: ref.watch(creditCardTextControllers).cardHolder,
//             // controller: ref
//             //     .watch(textControllerCreditCardHolder(initialCard?.cardHolder)),
//             inputFormatters: [
//               CreditCardHolderFormatter(),
//               FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
//             ],
//             textInputAction: TextInputAction.next,
//             hintText: AppStrings.hintCreditCardHolder,
//           ),
//           SizedBox(height: 50.h),
//           TextformfieldMain(
//             inputFormatters: [
//               FilteringTextInputFormatter.digitsOnly,
//               LengthLimitingTextInputFormatter(16),
//               CreditCardNumberFormatter(),
//             ],
//             onChanged: (value) => ref
//                 .read(textControllerCreditCardNumber(initialCard?.cardNumber))
//                 .text = value,
//             controller: ref
//                 .watch(textControllerCreditCardNumber(initialCard?.cardNumber)),
//             hintText: AppStrings.hintCreditCardNumber,
//             textInputType: TextInputType.number,
//           ),
//           SizedBox(height: 50.h),
//           Row(
//             children: [
//               Flexible(
//                 child: TextformfieldMain(
//                   onChanged: (value) => ref
//                       .read(textControllerCreditCardValidThru(
//                           initialCard?.validThru))
//                       .text = value,
//                   controller: ref.watch(textControllerCreditCardValidThru(
//                       initialCard?.validThru)),
//                   inputFormatters: [
//                     CreditCardDateFormatter(),
//                     LengthLimitingTextInputFormatter(5),
//                   ],
//                   hintText: AppStrings.hintCreditCardValidThru,
//                   textInputType: TextInputType.number,
//                 ),
//               ),
//               SizedBox(width: 30.w),
//               Flexible(
//                 child: TextformfieldMain(
//                   focusNode: cvvFocusNode,
//                   onChanged: (value) => ref
//                       .read(textControllerCreditCardCvv(initialCard?.cvv))
//                       .text = value,
//                   controller:
//                       ref.watch(textControllerCreditCardCvv(initialCard?.cvv)),
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(3),
//                   ],
//                   hintText: AppStrings.hintCreditCardCvv,
//                   textInputType: TextInputType.number,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
