import 'package:flutter/material.dart';
import 'package:brocoffe_moba/components/coffee_card.dart';
import 'package:brocoffe_moba/models/products.dart';
import 'package:brocoffe_moba/services/api_service.dart';
import 'order_page.dart';

class EzpzPage extends StatefulWidget {
  const EzpzPage({Key? key}) : super(key: key);

  @override
  _EzpzPageState createState() => _EzpzPageState();
}

class _EzpzPageState extends State<EzpzPage> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final products = await ApiService.getProducts();
      setState(() {
        _products = products;
      });
    } catch (e) {
      // Handle error
      print('Failed to fetch products: $e');
    }
  }

  void _navigateToOrderPage(
      BuildContext context, String nameOfProduct, int priceOfProduct) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          nameOfProduct: nameOfProduct,
          priceOfProduct: priceOfProduct,
          products: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(left: 55, top: 35),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "EZ PZ KOPI",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Karla',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Nikmati kopi dengan wawasan",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Karla',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "yang lebih dan mudah",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Karla',
                      ),
                    ),
                  ],
                ),

                // Image orang
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0),
                      child: Image.asset(
                        'assets/img/barista.png',
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8),
                  child: Text("Indonesian Coffee"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8),
                  child: Text("Indonesian Coffee"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8),
                  child: Text("Indonesian Coffee"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8),
                  child: Text("Indonesian Coffee"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Text(
                "Indonesian Coffee",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Karla",
                ),
              ),
            ),
          ),

          // List Of Item

          // List Of Item
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                print('Product: $product'); // Debug statement

                return GestureDetector(
                  onTap: () {
                    _navigateToOrderPage(
                      context,
                      product.coffeeName,
                      product.coffeePrice.toInt(),
                    );
                  },
                  child: CoffeeCard(
                    imagePath: "assets/img/list_kopi/Gula_Aren_Coffee.jpg",
                    coffeeName: product.coffeeName,
                    price: product.coffeePrice.toString(),
                    coffeName: product.coffeeName,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
