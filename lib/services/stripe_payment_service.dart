import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_shopping_project/services/abstract_classes/i_payment_service.dart';
import 'package:ecommerce_shopping_project/utilities/k_app_secrets.dart';

class StripePaymentService extends IPaymentService {
  @override
  Future<String?> createPaymentIntent() async {
    /// For Further Explanation:
    /// https://docs.stripe.com/api/payment_intents/create?lang=curl

    try {
      final Dio dio = Dio();
      var linkAPI = "https://api.stripe.com/v1/payment_intents";

      /// Amount statically set to $0.50 (50 cents) for security purposes during tests
      /// Instead of dynamically getting price parameters into payment methods
      Map<String, dynamic> data = {"amount": 50, "currency": "usd"};

      Map<String, dynamic> headers = {
        "Authorization": "Bearer ${ENV.STRIPE_SECRET_KEY}",
        "Content-Type": 'application/x-www-form-urlencoded'
      };

      Options options = Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: headers,
      );

      var response = await dio.post(linkAPI, data: data, options: options);

      if (response.data != null) {
        debugPrint(response.data);
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('e.runtimeType : ${e.runtimeType}');

      if (e is DioException) {
        debugPrint('e.runtimeType : ${e.runtimeType}');
        debugPrint('e.type : ${e.type}');
        debugPrint('e.stackTrace : ${e.stackTrace}');
        debugPrint('e.error : ${e.error}');
        debugPrint('e.message : ${e.message}');
        debugPrint('e.response : ${e.response}');
      }
    }
    return null;
  }

  @override
  Future<void> makeActualPayment() async {
    try {
      String? paymentIntentClientSecret = await createPaymentIntent();

      debugPrint('paymentIntentClientSecret: $paymentIntentClientSecret');

      if (paymentIntentClientSecret == null) return;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Jane Doe",
          customFlow: true,
          // style: ThemeMode.dark,
        ),
      );

      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e);
    }
  }
}
