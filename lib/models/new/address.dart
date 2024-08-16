import 'dart:convert';

class Address {
  final String id;
  final String fullName;
  final String? addressTitle;
  final String addressText;
  final String city;
  final String country;
  final int zipCode;

  Address({
    required this.id,
    required this.fullName,
    this.addressTitle,
    required this.addressText,
    required this.city,
    required this.country,
    required this.zipCode,
  });

  Address copyWith({
    String? id,
    String? fullName,
    String? addressTitle,
    String? addressText,
    String? city,
    String? country,
    int? zipCode,
  }) =>
      Address(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        addressTitle: addressTitle ?? this.addressTitle,
        addressText: addressText ?? this.addressText,
        city: city ?? this.city,
        country: country ?? this.country,
        zipCode: zipCode ?? this.zipCode,
      );

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        id: json["id"],
        fullName: json["fullName"],
        addressTitle: json["addressTitle"],
        addressText: json["addressText"],
        city: json["city"],
        country: json["country"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fullName": fullName,
        "addressTitle": addressTitle,
        "addressText": addressText,
        "city": city,
        "country": country,
        "zipCode": zipCode,
      };
}



// class Address {
//   final String id;
//   final String? fullName;
//   final String? addressTitle;
//   final String addressText;
//   final String city;
//   final String country;
//   final int zipCode;

//   Address({
//     required this.id,
//     this.fullName,
//     this.addressTitle,
//     required this.addressText,
//     required this.city,
//     required this.country,
//     required this.zipCode,
//   });
// }
