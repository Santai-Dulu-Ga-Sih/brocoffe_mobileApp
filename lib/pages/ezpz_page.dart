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
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'EZ PZ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GillSans',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Nikmati kopi dengan wawasan yang lebih dan mudah',
                textAlign: TextAlign.left,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'GillSans',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Image.asset(
                'assets/img/barista1.png',
                width: 100,
              ),
            ),
          ],
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
                            imagePath: "assets/img/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "assets/img/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "assets/img/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "assets/img/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "assets/img/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "assets/img/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "assets/img/coffe_1.png",
                            coffeName: "Kopi Jawa",
                            price: "12000",
                          ),
                        ),
                        GestureDetector(
                          onTap: putOnCart,
                          child: const CoffeeCard(
                            imagePath: "assets/img/coffe_1.png",
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
