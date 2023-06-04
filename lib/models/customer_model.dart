import 'package:crypto/crypto.dart';
import 'dart:convert';

class CustomerModel {
  final String customerId;
  final String customerUsername;
  final String customerPassword;

  CustomerModel({
    required this.customerId,
    required this.customerUsername,
    required this.customerPassword,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerId: json['customer_id'],
      customerUsername: json['customer_username'],
      customerPassword: json['customer_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'customer_username': customerUsername,
      'customer_password': customerPassword,
    };
  }

  String encryptPassword(String password) {
    var bytes = utf8.encode(password); // Convert password string to bytes
    var digest = sha1.convert(bytes); // Apply SHA-1 hashing algorithm
    return digest.toString(); // Return the hashed password
  }

  bool verifyPassword(String password) {
    var hashedPassword = encryptPassword(password);
    return customerPassword == hashedPassword;
  }
}
