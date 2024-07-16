import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenUtilSetup extends StatelessWidget {
  const ScreenUtilSetup({super.key, required this.homeScreen});

  final Widget homeScreen;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1179, 2556),
      // designSize: const Size(1179, 2256),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'ECommerce Shopping Project',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,

          // theme: ThemeData(
          //   fontFamily: 'Inter',
          //   textTheme: Theme.of(context).textTheme.copyWith(
          //         titleMedium: TextStyle(
          //           fontWeight: FontWeight.w100,
          //           fontSize: 40.sp,
          //           letterSpacing: 0,
          //         ),
          //       ),
          //   primaryTextTheme: TextTheme().copyWith(
          //     titleMedium: GoogleFonts.inter(
          //       fontWeight: FontWeight.w100,
          //       fontSize: 40.sp,
          //       // letterSpacing: 0,
          //       // textStyle: Theme.of(context).textTheme.titleMedium,
          //     ),
          //   ),
          // ),

          home: child,
        );
      },
      child: homeScreen,
    );
  }
}
