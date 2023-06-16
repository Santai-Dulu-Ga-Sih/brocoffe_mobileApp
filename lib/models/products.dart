class Product {
  int coffeeId;
  String coffeeUrl;
  String coffeeName;
  double coffeePrice;
  String coffeeType;
  String coffeeDescription;
  int purchaseCount;

  var nameOfProduct;

  var priceOfProduct;

  Product({
    required this.coffeeId,
    required this.coffeeUrl,
    required this.coffeeName,
    required this.coffeePrice,
    required this.coffeeType,
    required this.coffeeDescription,
    required this.purchaseCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      coffeeId: json['coffee_id'],
      coffeeUrl: json['coffee_url'],
      coffeeName: json['coffee_nama'],
      coffeePrice: json['coffee_harga'].toDouble(),
      coffeeType: json['coffee_jenis'],
      coffeeDescription: json['coffee_deskripsi'],
      purchaseCount: json['jumlah_pembelian'] ?? 0,
    );
  }

  // get nameOfProduct => null;

  // get priceOfProduct => null;
}
