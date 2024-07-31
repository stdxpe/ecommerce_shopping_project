import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_verification_code_dots.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';

class SwitchVerificationTextField extends StatelessWidget {
  const SwitchVerificationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SizedBox(
          // color: Colors.red.withOpacity(0.5),
          child: TextformfieldMain(
            autoFocus: true,
            text: '',
            textInputType: TextInputType.number,
            lineColor: Colors.transparent,
            textColor: Colors.transparent,
          ),
        ),
        SwitchVerificationCodeDots(
          currentIndex: 1,
          itemCount: 4,
        ),
      ],
    );
  }
}
