import 'dart:convert';

class CreditCard {
  final String id;
  final String cardHolder;
  final String cardNumber;
  final String validThru;
  final String cvv;

  CreditCard({
    required this.id,
    required this.cardHolder,
    required this.cardNumber,
    required this.validThru,
    required this.cvv,
  });

  CreditCard copyWith({
    String? id,
    String? cardHolder,
    String? cardNumber,
    String? validThru,
    String? cvv,
  }) =>
      CreditCard(
        id: id ?? this.id,
        cardHolder: cardHolder ?? this.cardHolder,
        cardNumber: cardNumber ?? this.cardNumber,
        validThru: validThru ?? this.validThru,
        cvv: cvv ?? this.cvv,
      );

  factory CreditCard.fromJson(String str) =>
      CreditCard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreditCard.fromMap(Map<String, dynamic> json) => CreditCard(
        id: json["id"],
        cardHolder: json["cardHolder"],
        cardNumber: json["cardNumber"],
        validThru: json["validThru"],
        cvv: json["cvv"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cardHolder": cardHolder,
        "cardNumber": cardNumber,
        "validThru": validThru,
        "cvv": cvv,
      };

  @override
  String toString() {
    return 'CreditCard(id: $id, cardHolder: $cardHolder, cardNumber: $cardNumber, validThru: $validThru, cvv: $cvv)';
  }
}
