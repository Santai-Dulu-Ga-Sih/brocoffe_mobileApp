import 'package:brocoffe_moba/theme.dart';
import 'package:flutter/material.dart';
import 'package:brocoffe_moba/pages/home_page.dart';
import 'package:brocoffe_moba/main.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(HomePage());
}

class Kopipedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 26.0),
                          child: Image.asset(
                            'assets/img/barista.png',
                            width: 100,
                          ),
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
      ),
    );
  }
}
