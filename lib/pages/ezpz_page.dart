import 'package:flutter/material.dart';
import 'package:brocoffe_moba/components/coffee_card.dart';

import 'order_page.dart';

class EzpzPage extends StatelessWidget {
  const EzpzPage({super.key});

  static String nameProduct = '';
  static int priceProduct = 0;

  void _navigateToOrderPage(
      BuildContext context, String nameOfProduct, int priceOfProduct) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderPage(
                  nameOfProduct: nameOfProduct,
                  priceOfProduct: priceOfProduct,
                )));
  }

  void viewByID() {}

  void putOnCart() {}

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
              child: // Kind of coffe
                  Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        viewByID;
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Text("Indonesian Coffe"),
                      ),
                    ),
                    GestureDetector(
                      onTap: viewByID,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Text("Indonesian Coffe"),
                      ),
                    ),
                    GestureDetector(
                      onTap: viewByID,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Text("Indonesian Coffe"),
                      ),
                    ),
                    GestureDetector(
                      onTap: viewByID,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Text("Indonesian Coffe"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                child: Text("Indonesian Coffe",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Karla")),
              ),
            ),

            // List Of Item

            Expanded(
              child: CustomScrollView(
                primary: false,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(10),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      children: [
                        GestureDetector(
                          onTap: () {
                            nameProduct = "Affogato Coffee";
                            priceProduct = 33000;
                            _navigateToOrderPage(
                                context, nameProduct, priceProduct);
                          },
                          child: const CoffeeCard(
                            imagePath:
                                "assets/img/list_kopi/Affogato_Coffee.jpg",
                            coffeName: "Affogato Coffee",
                            price: "33000",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            nameProduct = "Gula Aren Coffee";
                            priceProduct = 18000;
                            _navigateToOrderPage(
                                context, nameProduct, priceProduct);
                          },
                          child: const CoffeeCard(
                            imagePath:
                                "assets/img/list_kopi/Gula_Aren_Coffee.jpg",
                            coffeName: "Gula Aren Coffee",
                            price: "18000",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            nameProduct = "Irish Coffee";
                            priceProduct = 40000;
                            _navigateToOrderPage(
                                context, nameProduct, priceProduct);
                          },
                          child: const CoffeeCard(
                            imagePath: "assets/img/list_kopi/Irish_Coffee.jpg",
                            coffeName: "Irish Coffee",
                            price: "18000",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            nameProduct = "Flat White Coffee";
                            priceProduct = 23000;
                            _navigateToOrderPage(
                                context, nameProduct, priceProduct);
                          },
                          child: const CoffeeCard(
                            imagePath:
                                "assets/img/list_kopi/Flat_What_Coffee.jpg",
                            coffeName: "Flat White Coffee",
                            price: "23000",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
