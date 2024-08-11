class CreditCard {
  final String? cardTitle;
  final String cardHolder;
  final String cardNumber;
  final String validThru;
  final String cvv;

  CreditCard({
    this.cardTitle,
    required this.cardHolder,
    required this.cardNumber,
    required this.validThru,
    required this.cvv,
  });
}
