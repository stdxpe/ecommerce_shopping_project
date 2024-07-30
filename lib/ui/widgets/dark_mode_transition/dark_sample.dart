import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dark_mode_transition/dark_mode_transition.dart';

class DarkSample extends StatefulWidget {
  const DarkSample({super.key});

  @override
  _DarkSampleState createState() => _DarkSampleState();
}

class _DarkSampleState extends State<DarkSample> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final circleOffset = Offset(size.width - 20, size.height - 20);
    return DarkTransition(
      childBuilder: (context, x) => ProfileScreen(
        isDarkModeEnabled: isDark,
        onDarkModeEnabled: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
      offset: circleOffset,
      // offset: Offset(context.mediaQuery.size.width, 0),
      isDark: isDark,
    );
  }
}
