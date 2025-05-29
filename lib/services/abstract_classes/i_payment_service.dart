abstract class IPaymentService {
  Future<String?> createPaymentIntent();
  Future<void> makeActualPayment();
}
