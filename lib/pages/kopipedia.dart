import 'package:brocoffe_moba/theme.dart';
import 'package:flutter/material.dart';
import 'package:brocoffe_moba/pages/home_page.dart';
import 'package:brocoffe_moba/main.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(Kopipedia());
}

class Kopipedia extends StatefulWidget {
  @override
  _KopipediaState createState() => _KopipediaState();
}

class _KopipediaState extends State<Kopipedia> {
  String selectedButton = '';
  bool showBeansCard = false;
  bool showCoffeeCard = false;

  void _handleButtonClick(String buttonName) {
    setState(() {
      selectedButton = buttonName;
      if (buttonName == 'Beans') {
        showBeansCard = true;
        showCoffeeCard = false;
      } else if (buttonName == 'Coffee') {
        showBeansCard = false;
        showCoffeeCard = true;
      } else {
        showBeansCard = false;
        showCoffeeCard = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () => _handleButtonClick('Beans'),
                    text: 'Beans',
                    selectedButton: selectedButton,
                  ),
                  const SizedBox(width: 10.0),
                  CustomButton(
                    onPressed: () => _handleButtonClick('Coffee'),
                    text: 'Coffee',
                    selectedButton: selectedButton,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              if (showBeansCard) BeansCard(),
              if (showCoffeeCard) CoffeeCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String selectedButton;

  const CustomButton({
    required this.onPressed,
    required this.text,
    required this.selectedButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (selectedButton == text) {
              return const Color.fromARGB(255, 131, 128, 128);
            }
            return Colors.white;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(120.0, 40.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selectedButton == text ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class CoffeeCard extends StatefulWidget {
  @override
  _CoffeeCardState createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  int currentIndex = 0;
  List<Map<String, dynamic>> cards = [
    {
      'image': 'assets/img/kopi.png',
      'title': 'Data Card 1',
      'description':
          'Ini adalah deskripsi data card 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'image': 'assets/img/kopi.png',
      'title': 'Data Card 2',
      'description':
          'Ini adalah deskripsi data card 2. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
  ];

  void goToNextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % cards.length;
    });
  }

  void goToPrevCard() {
    setState(() {
      currentIndex = (currentIndex - 1 + cards.length) % cards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: goToPrevCard,
              child: Image.asset(
                'assets/img/prev_button.png',
                width: 48,
                height: 48,
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: goToNextCard,
              child: Image.asset(
                'assets/img/next_button.png',
                width: 48,
                height: 48,
              ),
            ),
          ],
        ),
        Image.asset(
          cards[currentIndex]['image'],
          width: 330,
          height: 185,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['title'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['description'],
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ]),
    );
  }
}

class BeansCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0,
      child: Column(
        children: [
          Image.asset(
            'assets/img/kopi.png',
            width: 330,
            height: 185,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Data Card',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Ini adalah deskripsi data card. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
