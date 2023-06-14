class ApiService {
  static var baseUrl = "http://192.168.56.1:8000/api";

  static var loginUrl = "$baseUrl/login";
  static var registUrl = "$baseUrl/registrasi";
  static var logoutUrl = "$baseUrl/logout";

  static var ezpzUrl = "$baseUrl/ez-pz-coffee";
  static var detail_ezpzUrl = "$baseUrl/ez-pz-coffee/{coffee_id}";

  static var cartUrl = "$baseUrl/cart/{coffee_id}";
  static var paymentUrl = "$baseUrl/payment/success/{customer_id}";
}
