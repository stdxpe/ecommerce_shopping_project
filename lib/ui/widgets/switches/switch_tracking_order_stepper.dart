import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/order_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/tracking_order_stepper_single_step.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchTrackingOrderStepper extends ConsumerWidget {
  const SwitchTrackingOrderStepper({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var status = ref.watch(orderStatus(order));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TrackingOrderStepperSingleStep(
          title: AppStrings.orderStatusStepReceived,
          isActive: status.activeStep >= 1 ? true : false,
          showContent: status.activeStep == 1 ? true : false,
          contentText: AppStrings.orderStatusReceivedMessage,
          date: status.statusReceivedDate,
        ),
        TrackingOrderStepperSingleStep(
          title: AppStrings.orderStatusStepPrepared,
          isActive: status.activeStep >= 2 ? true : false,
          showContent: status.activeStep == 2 ? true : false,
          contentText: AppStrings.orderStatusPreparedMessage,
          date: status.statusPreparedDate ?? status.statusReceivedDate,
        ),
        TrackingOrderStepperSingleStep(
          title: AppStrings.orderStatusStepOnTheWay,
          isActive: status.activeStep >= 3 ? true : false,
          showContent: status.activeStep == 3 ? true : false,
          contentText: AppStrings.orderStatusOnTheWayMessage,
          date: status.statusOnTheWayDate ?? status.statusReceivedDate,
        ),
        TrackingOrderStepperSingleStep(
          title: AppStrings.orderStatusStepDelivered,
          isActive: status.activeStep >= 4 ? true : false,
          showContent: status.activeStep == 4 ? true : false,
          isLastStep: true,
          contentText: AppStrings.orderStatusDeliveredMessage,
          date: status.statusDeliveredDate ?? status.statusReceivedDate,
        ),
      ],
    );
  }
}
