import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final String imagePath;
  final String coffeName;
  final String price;
  const CoffeeCard({
    super.key,
    required this.imagePath,
    required this.coffeName,
    required this.price,
    required String coffeeName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      color: Colors.transparent,
      child: Column(
        children: [
          // image of coffee
          Image.asset(
            imagePath,
            width: 140,
          ),

          SizedBox(
            width: 130,
            child: Text(
              coffeName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 130,
            child: Text("Rp. " + price),
          )
        ],
      ),
    );
  }
}
