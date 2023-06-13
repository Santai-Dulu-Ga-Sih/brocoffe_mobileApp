import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final int coffee_id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.coffee_id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      coffee_id: json['coffee_id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coffee_id': coffee_id,
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  static Future<List<Product>> fetchAll() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/ez-pz-coffee'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  static Future<Product> fetchById(int coffee_id) async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/ez-pz-coffee/$coffee_id'));
    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      return Product.fromJson(data);
    } else {
      throw Exception('Failed to fetch product');
    }
  }

  Future<void> create() async {
    final response = await http.post(
      Uri.parse('YOUR_API_ENDPOINT'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create product');
    }
  }

  Future<void> update() async {
    final response = await http.put(
      Uri.parse('YOUR_API_ENDPOINT/$coffee_id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update product');
    }
  }

  Future<void> delete() async {
    final response =
        await http.delete(Uri.parse('YOUR_API_ENDPOINT/$coffee_id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }
}
