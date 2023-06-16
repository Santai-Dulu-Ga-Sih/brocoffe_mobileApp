class Cart {
  final int cartId;
  final double totalHarga;
  final String beans;
  final String cups;
  final int customerId;
  final int coffeeId;

  Cart({
    required this.cartId,
    required this.totalHarga,
    required this.beans,
    required this.cups,
    required this.customerId,
    required this.coffeeId,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      cartId: json['cart_id'],
      totalHarga: json['total_harga'],
      beans: json['beans'],
      cups: json['cups'],
      customerId: json['customer_id'],
      coffeeId: json['coffee_id'],
    );
  }
}
