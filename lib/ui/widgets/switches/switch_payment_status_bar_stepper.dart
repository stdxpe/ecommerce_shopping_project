import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchPaymentStatusBarStepper extends StatefulWidget {
  SwitchPaymentStatusBarStepper({
    super.key,
    required this.activeStep,
    required this.onPressed,
  });

  int activeStep;
  final Function(int) onPressed;

  @override
  State<SwitchPaymentStatusBarStepper> createState() =>
      _SwitchPaymentStatusBarStepperState();
}

class _SwitchPaymentStatusBarStepperState
    extends State<SwitchPaymentStatusBarStepper> {
  double iconSize = 20;
  @override
  Widget build(BuildContext context) {
    Color activeColor = context.colorPalette.text;
    Color passiveColor = context.colorPalette.text.withOpacity(0.25);
    Color bgColor = context.colorPalette.text.withOpacity(0.12);

    // Color activeColor = Colors.black;
    // Color passiveColor = Colors.black26;
    // Color bgColor = Colors.black12;
    // int activeStep = widget.currentStepParam;
    return Padding(
      padding: const EdgeInsets.only(
        top: 0.0,
        bottom: 10,
      ),
      child: EasyStepper(
          alignment: Alignment.bottomCenter,
          disableScroll: true,
          internalPadding: 0,
          showTitle: false,
          showScrollbar: false,
          titlesAreLargerThanSteps: false,
          padding: EdgeInsets.zero,
          activeStep: widget.activeStep,
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
              // icon: Icon(Icons.location_on),
              customStep: Icon(
                Icons.location_on,
                size: iconSize,
                color: 0 <= widget.activeStep ? activeColor : passiveColor,
              ),
              // enabled: true or false, depends on allowTabStepping() method..
            ),
            EasyStep(
              customStep: Icon(
                Icons.credit_card,
                size: iconSize,
                color: 1 <= widget.activeStep ? activeColor : passiveColor,
              ),
            ),
            EasyStep(
              customStep: Icon(
                Icons.check_circle,
                size: iconSize,
                color: 2 <= widget.activeStep ? activeColor : passiveColor,
              ),
            ),
          ],
          onStepReached: (index) {
            setState(() {
              widget.activeStep = index;
            });
            widget.onPressed(index);
          }),
    );
  }
}
