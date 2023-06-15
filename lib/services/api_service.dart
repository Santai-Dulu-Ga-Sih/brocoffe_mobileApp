import 'package:http/http.dart' as http;

class ApiService {
  static String getBaseUrl() {
    const baseUrl = 'http://127.0.0.1:8000/api';
    return baseUrl;
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

  // Tambahkan metode lainnya sesuai kebutuhan aplikasi Anda
}
