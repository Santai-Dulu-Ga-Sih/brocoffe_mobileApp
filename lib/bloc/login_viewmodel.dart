import 'package:flutter/foundation.dart';
import 'package:brocoffe_moba/models/customer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginViewModel extends ChangeNotifier {
  String username = '';
  String password = '';
  bool isLoading = false;
  String errorMessage = '';

  Future<CustomerModel?> login() async {
    try {
      isLoading = true;
      errorMessage = '';

      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final customerModel = CustomerModel.fromJson(jsonData);
        return customerModel;
      } else {
        errorMessage = 'Failed to login. Please try again.';
        return null;
      }
    } catch (e) {
      errorMessage = 'An error occurred. Please try again later.';
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
