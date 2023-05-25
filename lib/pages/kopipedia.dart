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
                'KOPIPEDIA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GillSans',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Bukan sekadar kopi yang dinikmati, tetapi apa yang ada dibelakang kopi itu juga dinikmati',
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
                'assets/img/barista.png',
                width: 100,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () => _handleButtonClick('Beans'),
                    text: 'Beans',
                    selectedButton: selectedButton,
                  ),
                  SizedBox(width: 10.0),
                  CustomButton(
                    onPressed: () => _handleButtonClick('Coffee'),
                    text: 'Coffee',
                    selectedButton: selectedButton,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
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
          fontFamily: 'GillSans',
          fontSize: 16,
          fontWeight: FontWeight.normal,
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
      'image': 'assets/img/kopipedia_gulaaren.png',
      'title': 'Kopi Gula Aren',
      'description':
          'Masyarakat Indonesia mulai mengkombinasikan kopi dengan gula aren untuk membuat minuman kopi yang unik dengan rasa yang khas. Kopi gula aren menjadi populer sebagai minuman tradisional yang disajikan di warung kopi atau kedai kopi di berbagai daerah di Indonesia, terutama di Jawa, Sumatra, dan Sulawesi. Kopi gula aren biasanya disajikan dalam bentuk kopi tubruk, yaitu metode penyeduhan kopi tradisional Indonesia yang melibatkan pencampuran kopi bubuk dengan air panas. Kemudian, gula aren dipotong kecil-kecil dan dimasukkan ke dalam cangkir atau gelas, lalu diseduh dengan kopi panas. Kopi gula aren memiliki rasa yang kaya dan manis karena gula aren yang memberikan sentuhan karamel yang lezat.',
      'beans': 'Robusta / Arabica',
      'speciality': 'Aren Sugar',
    },
    {
      'image': 'assets/img/kopipedia_americano.png',
      'title': 'Robusta',
      'description':
          'Masyarakat Indonesia mulai mengkombinasikan kopi dengan gula aren untuk membuat minuman kopi yang unik dengan rasa yang khas. Kopi gula aren menjadi populer sebagai minuman tradisional yang disajikan di warung kopi atau kedai kopi di berbagai daerah di Indonesia, terutama di Jawa, Sumatra, dan Sulawesi. Kopi gula aren biasanya disajikan dalam bentuk kopi tubruk, yaitu metode penyeduhan kopi tradisional Indonesia yang melibatkan pencampuran kopi bubuk dengan air panas. Kemudian, gula aren dipotong kecil-kecil dan dimasukkan ke dalam cangkir atau gelas, lalu diseduh dengan kopi panas. Kopi gula aren memiliki rasa yang kaya dan manis karena gula aren yang memberikan sentuhan karamel yang lezat.',
      'beans': 'Robusta / Arabica',
      'speciality': 'Aren Sugar',
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
            const SizedBox(width: 16),
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
        SizedBox(height: 20.0),
        Image.asset(
          cards[currentIndex]['image'],
          width: 330,
          height: 185,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['title'],
            style: const TextStyle(
              fontFamily: 'GillSans',
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['description'],
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontFamily: 'GillSans',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: greyColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'BEANS FROM',
            style: TextStyle(
              fontFamily: 'GillSans',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkgreyColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['beans'],
            style: const TextStyle(
              fontFamily: 'GillSans',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: greyColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'RESTED FOR',
            style: TextStyle(
              fontFamily: 'GillSans',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkgreyColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['speciality'],
            style: const TextStyle(
              fontFamily: 'GillSans',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: greyColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Metode penyeduhan kopi tradisional Indonesia yang melibatkan pencampuran kopi bubuk dengan air panas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'GillSans',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: greyColor,
            ),
          ),
        ),
      ]),
    );
  }
}

class BeansCard extends StatefulWidget {
  @override
  _BeansCardState createState() => _BeansCardState();
}

class _BeansCardState extends State<BeansCard> {
  int currentIndex = 0;
  List<Map<String, dynamic>> cards = [
    {
      'image': 'assets/img/kopipedia_kopi.png',
      'title': 'Arabica',
      'description':
          'Kopi arabika pertama di dunia berasal dari Ethiopia, kemudian oleh bangsa Arab disebarkan ke penjuru dunia. Arabika adalah kopi paling populer sejagad raya. Harga kopi arabika pun lebih mahal karena perawatan dan pembudidayaannya tidak mudah. Ciri khas hasil dari kopi arabika adalah warna seduhan yang tidak terlalu pekat sehingga tingkat keasamannya lebih tinggi daripada kafeinnya. Dibandingkan dengan jenis-jenis kopi lainnya, kopi arabika memiliki aroma yang lebih wangi dan kaya.',
      'asal': 'South/Central America & Africa',
      'rested': '3-10 hari'
    },
    {
      'image': 'assets/img/kopipedia_kopi.png',
      'title': 'Robusta',
      'description':
          'Biji kopi robusta ditemukan di negara Kongo dalam ketinggian 400-700 mdpl dengan suhu 21-24 derajat celcius. Jenis kopi robusta lebih tahan terhadap serangan penyakit karat daun, namun memerlukan 10-11 bulan untuk proses pembuahannya menjadi buah. Dari segi rasa, kopi robusta cenderung lebih pahit dibandingkan arabika. Namun, dari segi harga, robusta lebih murah dibandingkan jenis kopi lainnya.',
      'asal': 'Indonesia',
      'rested': '1-3 hari'
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
            const SizedBox(width: 16),
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
        SizedBox(height: 20.0),
        Image.asset(
          cards[currentIndex]['image'],
          width: 330,
          height: 185,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['title'],
            style: const TextStyle(
              fontFamily: 'GillSans',
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['description'],
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontFamily: 'GillSans',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: greyColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'BEANS FROM',
            style: TextStyle(
              fontFamily: 'GillSans',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkgreyColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['asal'],
            style: const TextStyle(
              fontFamily: 'GillSans',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: greyColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'RESTED FOR',
            style: TextStyle(
              fontFamily: 'GillSans',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkgreyColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            cards[currentIndex]['rested'],
            style: const TextStyle(
              fontFamily: 'GillSans',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: greyColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'tergantung pada varian dan tingkat pemanggangan, untuk memungkinkan pelepasan gas dan pelunakan',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'GillSans',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: greyColor,
            ),
          ),
        ),
      ]),
    );
  }
}
