import 'package:brocoffe_moba/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonShopee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return // Bottom button
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            username: '',
                          )),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Shopee Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final int quantityProduct;
  final int totalPrice;
  final String nameProduct;
  const CartPage(
      {super.key,
      required this.quantityProduct,
      required this.totalPrice,
      required this.nameProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "PRODUK",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    height: double.infinity,
                    margin: EdgeInsets.only(left: 30),
                    child:
                        //images
                        Row(
                      children: [
                        Container(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Image.asset(
                              'assets/img/list_kopi/Gula_Aren_Coffee.jpg',
                              width: 100,
                            ),
                          ),
                        ),

                        // desc
                        Container(
                          height: 100,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  quantityProduct.toString() +
                                      ("x ") +
                                      nameProduct,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(totalPrice.toString() + (" IDR")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "ALAMAT",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Text(
                    "Jl. H. Mansyur No.17K, RT.11/RW.04, Bojongsoang, Kec. Bojongsoang, Kabupaten Bandung, Jawa Barat 40288",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      top: BorderSide(color: Colors.grey))),
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  const Text(
                    "SUBTOTAL",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Rp. $totalPrice",
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 350,
            ),
            ButtonShopee()
          ],
        ),
      ),
    );
  }
}
