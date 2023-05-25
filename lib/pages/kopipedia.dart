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
  bool showDataCard = false;
  bool showCoffeeCard = false;

  void _handleButtonClick(String buttonName) {
    setState(() {
      selectedButton = buttonName;
      if (buttonName == 'Data') {
        showDataCard = true;
        showCoffeeCard = false;
      } else if (buttonName == 'Coffee') {
        showDataCard = false;
        showCoffeeCard = true;
      } else {
        showDataCard = false;
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
                    onPressed: () => _handleButtonClick('Data'),
                    text: 'Data',
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
              if (showDataCard) DataCard(),
              if (showCoffeeCard) CoffeeCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends ElevatedButton {
  CustomButton({
    required VoidCallback onPressed,
    required String text,
    required String selectedButton,
    Key? key,
  }) : super(
          onPressed: onPressed,
          key: key,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (selectedButton == text) {
                  return Color.fromARGB(255, 131, 128, 128);
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
              Size(120.0, 40.0),
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

class DataCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide.none, // Menghapus garis
        borderRadius: BorderRadius.circular(0), // Mengatur sudut kartu
      ),
      elevation: 0, // Menghapus elevation
      child: Column(
        children: [
          Image.asset(
            'assets/img/logo.png',
            width: 150,
            height: 150,
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

class CoffeeCard extends StatelessWidget {
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
            width: 150,
            height: 150,
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
