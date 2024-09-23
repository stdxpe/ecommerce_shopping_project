import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_order_repository.dart';
import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/order.dart' as model;
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shipping_addresses_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/user_provider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final ordersProvider = AsyncNotifierProvider<OrdersNotifier, List<model.Order>>(
    () => OrdersNotifier());

class OrdersNotifier extends AsyncNotifier<List<model.Order>> {
  @override
  FutureOr<List<model.Order>> build() async {
    getOrders();
    return await future;
  }

  final _orderManager = locator<IOrderRepository>();

  getOrders() async {
    debugPrint('OrdersNotifier | getOrders() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _orderManager.getOrders(
          userModel: ref.watch(userProvider).value!);
    });
  }

  createOrder() async {
    debugPrint('OrdersNotifier | createOrder() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        var shoppingCart = ref.watch(shoppingCartProvider);
        Address? shippingAddress = ref.watch(addressProviderForSummary);
        double totalPrice =
            ref.read(shoppingCartProvider.notifier).getTotalAmount();
        double shippingFee =
            ref.read(shoppingCartProvider.notifier).getShippingFee();

        if (shoppingCart.value != null &&
            shoppingCart.value!.isNotEmpty &&
            shippingAddress != null &&
            totalPrice > 0) {
          model.Order newOrder = await _orderManager.createOrder(
            shoppingCartProducts: shoppingCart.value!,
            shippingAddress: shippingAddress,
            totalPrice: totalPrice + shippingFee,
            userModel: ref.watch(userProvider).value!,
          );

          return [...previousState, newOrder];
        } else {
          return [...previousState];
        }
      },
    );
  }

  int getOrdersCount() {
    return ((state.value != null && state.value!.isNotEmpty))
        ? state.value!.length
        : 0;
  }
}

typedef OrderStatusOutput = ({
  int activeStep,
  String statusReceivedDate,
  String? statusPreparedDate,
  String? statusOnTheWayDate,
  String? statusDeliveredDate,
});

final orderStatus =
    StateProvider.family<OrderStatusOutput, model.Order>((ref, order) {
  if (order.status == AppStrings.orderStatusStepReceived) {
    return (
      activeStep: 1,
      statusReceivedDate: order.statusReceivedDate.formatDate,
      statusPreparedDate: null,
      statusOnTheWayDate: null,
      statusDeliveredDate: null,
    );
  } else if (order.status == AppStrings.orderStatusStepPrepared) {
    return (
      activeStep: 2,
      statusReceivedDate: order.statusReceivedDate.formatDate,
      statusPreparedDate: order.statusPreparedDate?.formatDate,
      statusOnTheWayDate: null,
      statusDeliveredDate: null,
    );
  } else if (order.status == AppStrings.orderStatusStepOnTheWay) {
    return (
      activeStep: 3,
      statusReceivedDate: order.statusReceivedDate.formatDate,
      statusPreparedDate: order.statusPreparedDate?.formatDate,
      statusOnTheWayDate: order.statusOnTheWayDate?.formatDate,
      statusDeliveredDate: null,
    );
  } else if (order.status == AppStrings.orderStatusStepDelivered) {
    return (
      activeStep: 4,
      statusReceivedDate: order.statusReceivedDate.formatDate,
      statusPreparedDate: order.statusPreparedDate?.formatDate,
      statusOnTheWayDate: order.statusOnTheWayDate?.formatDate,
      statusDeliveredDate: order.statusDeliveredDate?.formatDate
    );
  } else {
    return (
      activeStep: 0,
      statusReceivedDate: order.statusReceivedDate.formatDate,
      statusPreparedDate: null,
      statusOnTheWayDate: null,
      statusDeliveredDate: null,
    );
  }
});
