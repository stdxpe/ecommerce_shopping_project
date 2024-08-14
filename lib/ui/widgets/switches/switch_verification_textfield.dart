import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/verification_code_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_verification_code_dots.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';

class SwitchVerificationTextField extends ConsumerWidget {
  const SwitchVerificationTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(verificationNavigatorProvider(context));
    return Stack(
      children: [
        Container(
          color: Colors.red.withOpacity(0.5),
          child: TextformfieldMain(
            onChanged: (value) {
              ref.watch(verificationCodeProvider.notifier).updateCode(value);
              print(value);
              // ref.read(verificationNavigatorProvider(context));
              ref.watch(verificationCodeProvider.notifier).getStatus()
                  ? context.push(Routes.home)
                  : null;
              print('status: ${ref.watch(verificationCodeProvider).status}');
            },
            autoFocus: true,
            hintText: '',
            textInputType: TextInputType.number,
            lineColor: Colors.transparent,
            textColor: Colors.transparent,
            paddingHorizontal: 400.w,
            textInputAction: TextInputAction.done,
          ),
        ),
        SwitchVerificationCodeDots(
          currentIndex:
              ref.watch(verificationCodeProvider).code.text?.length ?? 0,
          itemCount: 4,
        ),
      ],
    );
  }
}
