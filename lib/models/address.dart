class Address {
  final String? fullName;
  final String? addressTitle;
  final String addressText;
  final String city;
  final String country;
  final int zipCode;

  Address({
    this.fullName,
    this.addressTitle,
    required this.addressText,
    required this.city,
    required this.country,
    required this.zipCode,
  });
}
