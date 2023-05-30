import 'package:http/http.dart' as http;
import 'dart:convert';

final String url =
    'http://10.0.2.2:8000/api/ez-pz-coffee'; // Ganti dengan URL API yang benar

Future<List<dynamic>> fetchEzPzData() async {
  var response = await http.get(Uri.parse(url));
  var data = json.decode(response.body);

  return data;
}
