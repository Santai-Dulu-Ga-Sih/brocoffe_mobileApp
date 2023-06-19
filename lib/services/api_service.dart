// ignore_for_file: unused_local_variable

import 'package:brocoffe_moba/models/customer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:brocoffe_moba/models/products.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static String getBaseUrl() {
    const baseUrl = 'http://127.0.0.1:8000/api';
    return baseUrl;
  }

  static Future<Map<String, dynamic>> register(
      String username, String password) async {
    final url = '${getBaseUrl()}/registrasi';
    final response = await http.post(Uri.parse(url), body: {
      'customer_username': username,
      'customer_password': password,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'success': true,
        'message': 'Account registered',
        'data': data,
      };
    } else {
      final errorMessage = 'Error: Failed to register account';
      throw Exception(errorMessage);
    }
  }

  static Future<http.Response> login(String username, String password) async {
    final baseUrl = getBaseUrl();
    final url = Uri.parse('$baseUrl/login');
    final body = {
      'customer_username': username,
      'customer_password': password,
    };
    final response = await http.post(url, body: body);
    return response;
  }

  static Future<List<Product>> getProducts() async {
    final baseUrl = getBaseUrl();
    final url = Uri.parse('$baseUrl/ez-pz-coffee');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final products = List<Product>.from(
          jsonResponse['data'].map((data) => Product.fromJson(data)));
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<Map<String, dynamic>> addToCart(
      int coffeeId, String beans, String cups) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? customerData =
        prefs.getString('customer'); // Ambil data customer dari sesi

    if (customerData != null) {
      final customer = Customer.fromJson(jsonDecode(customerData));

      final url = '${getBaseUrl()}/cart/$coffeeId';
      final response = await http.post(Uri.parse(url), body: {
        'beans': beans,
        'cups': cups,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'message': 'Item added to cart',
          'data': data,
        };
      } else {
        final errorMessage = 'Error: Failed to add item to cart';
        throw Exception(errorMessage);
      }
    } else {
      final errorMessage = 'Error: Customer not logged in';
      throw Exception(errorMessage);
    }
  }
}
