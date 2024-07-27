import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/tracking_order_stepper_single_step.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchTrackingOrderStepper extends StatelessWidget {
  const SwitchTrackingOrderStepper({
    super.key,
    required this.activeStep,
  });

  final int activeStep;

  /// TODO: Content Texts gotta come from Riverpod
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TrackingOrderStepperSingleStep(
          title: AppStrings.trackingOrderScreenStepReceived,
          isActive: activeStep >= 1 ? true : false,
          showContent: activeStep == 1 ? true : false,
          contentText: 'Store has received your order.',
          date: '12.03.2024',
        ),
        TrackingOrderStepperSingleStep(
          title: AppStrings.trackingOrderScreenStepPrepared,
          isActive: activeStep >= 2 ? true : false,
          showContent: activeStep == 2 ? true : false,
          contentText:
              'Store is currently preparingpreparingpreparingpreparingpreparingpreparingpreparingpreparingpreparingpreparingpreparingpreparingpreparingpreparingpreparing your order.',
          date: '14.03.2024',
        ),
        TrackingOrderStepperSingleStep(
          title: AppStrings.trackingOrderScreenStepOnTheWay,
          isActive: activeStep >= 3 ? true : false,
          showContent: activeStep == 3 ? true : false,
          contentText:
              'Your order is on the way.\nClick here to track shipment status',
          date: '19.03.2024',
        ),
        TrackingOrderStepperSingleStep(
          title: AppStrings.trackingOrderScreenStepDelivered,
          isActive: activeStep >= 4 ? true : false,
          showContent: activeStep == 4 ? true : false,
          isLastStep: true,
          contentText: 'Your order has been delivered',
          date: '21.03.2024',
        ),
      ],
    );
  }
}
