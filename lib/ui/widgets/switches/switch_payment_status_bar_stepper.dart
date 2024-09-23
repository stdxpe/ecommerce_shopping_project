import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchPaymentStatusBarStepper extends StatelessWidget {
  const SwitchPaymentStatusBarStepper(
      {super.key, required this.activeStep, required this.onPressed});

  final int activeStep;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    Color activeColor = context.colorPalette.text;
    Color passiveColor = context.colorPalette.text.withOpacity(0.25);
    Color bgColor = context.colorPalette.text.withOpacity(0.12);
    double iconSize = 65.h;

    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 10),
      child: EasyStepper(
        onStepReached: (index) => onPressed(index),
        alignment: Alignment.bottomCenter,
        disableScroll: true,
        internalPadding: 0,
        showTitle: false,
        showScrollbar: false,
        titlesAreLargerThanSteps: false,
        padding: EdgeInsets.zero,
        activeStep: activeStep,
        defaultStepBorderType: BorderType.normal,
        stepShape: StepShape.circle,
        stepBorderRadius: 0,
        borderThickness: 0,
        stepRadius: 20,
        lineStyle: LineStyle(
          lineLength: 60,
          lineSpace: 7.5,
          lineThickness: 2,
          finishedLineColor: activeColor,
          unreachedLineColor: passiveColor,
          activeLineColor: passiveColor,
        ),
        activeStepBackgroundColor: bgColor,
        finishedStepBackgroundColor: bgColor,
        activeStepIconColor: activeColor,
        finishedStepIconColor: activeColor,
        unreachedStepIconColor: passiveColor,
        showLoadingAnimation: false,
        steps: [
          EasyStep(
            customStep: Icon(
              Icons.location_on,
              size: iconSize,
              color: 0 <= activeStep ? activeColor : passiveColor,
            ),
          ),
          EasyStep(
            customStep: Icon(
              Icons.credit_card,
              size: iconSize,
              color: 1 <= activeStep ? activeColor : passiveColor,
            ),
          ),
          EasyStep(
            customStep: Icon(
              Icons.check_circle,
              size: iconSize,
              color: 2 <= activeStep ? activeColor : passiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
