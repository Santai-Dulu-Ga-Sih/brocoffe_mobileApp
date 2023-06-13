import 'package:flutter/material.dart';
import 'cart.dart';



class OrderPage extends StatefulWidget {
  final String nameOfProduct;
  final int priceOfProduct;

  const OrderPage(
      {super.key, required this.nameOfProduct, required this.priceOfProduct});

  void _navigateToCart(BuildContext context, String nameProduct, int totalPrice,
      int quantityProduct) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CartPage(
                  nameProduct: nameOfProduct,
                  totalPrice: totalPrice,
                  quantityProduct: quantityProduct,
                )));
  }

  @override
  State<OrderPage> createState() => _PlusMinusClickerState();
}

class _PlusMinusClickerState extends State<OrderPage> {
  int _quantity = 0;
  int selectedOption_beans = 0;
  String optionBeans = "NONE";
  int selectedOption_cup = 0;
  String optionCup = "NONE";
  int constraint = 0;

  int totalPrice = 0;

  void increment() {
    setState(() {
      _quantity++;
      totalPrice += widget.priceOfProduct;
    });
  }

  void decrement() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        totalPrice -= widget.priceOfProduct;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Coffee Section
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.red,
            child: Image.asset(
              'lib/images/coffe_1.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0.001,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(widget.nameOfProduct,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Karla")),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15),
                        child: Text(
                            "Sebagai warisan budaya kopi Indonesia, kopi gula aren yang khas dari wilayah Jawa ini diangkat ke tingkat nasional oleh Esprecielo Artisan Java Brown. Ini merupakan perpaduan antara harmonis kopi asli arabika Jawa dengan gula aren alami khas Jawa ditambah sentuhan lembut dari susu.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Karla")),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // End of Coffee Section

          // Quantity
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: SizedBox(
              width: 250,
              child: Row(
                children: [
                  const Text(
                    "Quantity",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Karla",
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: decrement,
                  ),
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: Text(
                        _quantity.toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Karla",
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: increment,
                  ),
                ],
              ),
            ),
          ),
          // End Of Quantity
          const SizedBox(
            height: 30,
          ),
          // Beans
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            width: double.infinity,
            child: const Center(
              child: Text(
                "Beans",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),

          // Checkbox
          CheckboxListTile(
            title: const Text('Robusta'),
            value: selectedOption_beans == 1,
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedOption_beans = 1;
                  optionBeans = "Robusta";
                }
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Arabica'),
            value: selectedOption_beans == 2,
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedOption_beans = 2;
                  optionBeans = "Arabica";
                }
              });
            },
          ),

          // End of Beans

          // Cup
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            width: double.infinity,
            child: const Center(
              child: Text(
                "Cup",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),

          // Checkbox
          CheckboxListTile(
            title: const Text('Regular'),
            value: selectedOption_cup == 1,
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedOption_cup = 1;
                  optionCup = "Regular";
                }
              });
            },
          ),
          CheckboxListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Large'),
                Text(
                  '+Rp5000',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.black26),
                )
              ],
            ),
            value: selectedOption_cup == 2,
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedOption_cup = 2;
                  optionCup = "Large";
                }
              });
            },
          ),

          // End of Cup
          const SizedBox(
            height: 20,
          ),

          // Bottom button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0.001,
                    blurRadius: 10,
                    offset: const Offset(10, 0),
                  ),
                ],
              ),
              height: 100,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber)),
                    onPressed:
                        // kirim database
                        () => {Navigator.pop(context)},
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Lanjut Belanja'),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {
                      if (optionCup == "Large") {
                        totalPrice += 5000;
                      }
                      widget._navigateToCart(
                          context, widget.nameOfProduct, totalPrice, _quantity);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Bayar'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
