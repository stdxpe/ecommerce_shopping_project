import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_in_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TextformfieldTestScreen extends ConsumerWidget {
  const TextformfieldTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          SizedBox(height: 274.h),
          TextformfieldMain(
            onChanged: (value) =>
                ref.watch(signInProvider.notifier).updateEmail(value),
            validator: (value) => ref.watch(signInProvider).email.error,
            hintText: AppStrings.signInScreenTextFieldEmail,
            textColor: context.colorPalette.permaWhiteColor,
            lineColor: context.colorPalette.permaWhiteColor,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          TextformfieldMain(
            onChanged: (value) =>
                ref.watch(signInProvider.notifier).updatePassword(value),
            validator: (value) => ref.watch(signInProvider).password.error,
            obscureText: true,
            hintText: AppStrings.signInScreenTextFieldPassword,
            textColor: context.colorPalette.permaWhiteColor,
            lineColor: context.colorPalette.permaWhiteColor,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 274.h),
          ButtonMain(
            onPressed: () {
              ref.watch(signInProvider.notifier).getStatus();
              print('status: ${ref.watch(signInProvider).status}');

              if (ref.watch(signInProvider).status!)
                context.push(Routes.shoppingCart);
            },
            paddingHorizontal: 0,
            text: AppStrings.signIn,
          ),
        ],
      ),
    );
  }
}

// final email = ref.watch(signInNotifierProvider).email;

//  BTextField(
//               label: 'Username',
//               hintText: 'Enter username',
//               onChanged: (value) =>
//                   ref.read(signInNotifierProvider.notifier).updateEmail(value),
//               inputType: TextInputType.name,
//               validator: (value) => email.error?.getMessage(),
//             ),

/////////////
///
///

// final pinCodeControllerX = Provider.autoDispose<TextEditingController>((ref) {
//   final controller = TextEditingController();

//   ref.onDispose(() {
//     controller.dispose();
//   });

//   return controller;
// });

// I think you are passing the TextEditingController itself to the TextField you are customizing here, so the reference is disposing.
// I changed the argument type to AutoDisposeProvider<TextEditingController>, passed the provider itself, and then did the watch with the custom TextField and it worked.

//             child: CustomPinCodeField(
//               controllerProvider: pinCodeControllerX,
//               backgroundColor: AppColors.ultraLightGrey,
//               isObscured: false,
//               fieldHeight: 60,
//               cursorColor: AppColors.slightlyGrey,
//               keyboardType: TextInputType.none,
//               onComplete: (val) {
//                 pushNamed(AppRoutes.homeRoute);
//               },
//               textStyle: TextStyle(fontSize: 26, color: AppColors.white),
//             ),
