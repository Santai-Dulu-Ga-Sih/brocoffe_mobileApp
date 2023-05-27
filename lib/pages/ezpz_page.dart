import 'package:flutter/material.dart';

import 'package:brocoffe_moba/components/coffee_card.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EzpzPage extends StatelessWidget {
  const EzpzPage({super.key});

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
                          'lib/images/barista1.png',
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
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "lib/images/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "lib/images/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "lib/images/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "lib/images/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "lib/images/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "lib/images/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "lib/images/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "lib/images/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
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
