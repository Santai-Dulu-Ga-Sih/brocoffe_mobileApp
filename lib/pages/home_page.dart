import 'package:brocoffe_moba/pages/addresess.dart';
import 'package:brocoffe_moba/pages/login_page.dart';
import 'package:brocoffe_moba/theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:brocoffe_moba/pages/kopipedia.dart';
import 'package:brocoffe_moba/pages/tentang_kami.dart';
import 'account_detail.dart';
import 'ezpz_page.dart';
import 'payment_method.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  final List<String> itemList = [
    'Affogato_Coffee',
    'Gula_Aren_Coffee',
  ];

  final List<String> mainTextList = [
    'Affogato Coffee',
    'Gula Aren Coffee',
  ];

  final List<String> subTextList = [
    'Rp33.000',
    'Rp18.000',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset('assets/img/burger_menu.png',
                    width: 26, height: 26),
                onPressed: () {
                  Scaffold.of(context)
                      .openDrawer(); // Menggunakan openEndDrawer() untuk membuka drawer
                },
                tooltip:
                    'Open Drawer', // Mengganti MaterialLocalizations.of(context).openAppDrawerTooltip
              );
            },
          ),
          centerTitle: true,
          title: Image.asset(
            "assets/img/brocoffe_logo.png",
            width: 165,
            height: 29,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Add the desired functionality when the icon is pressed
              },
              icon: Image.asset('assets/img/bill.png',
                  width: 21.67, height: 21.67),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 3.0),
              CarouselSlider(
                items: [
                  Image.asset('assets/img/robusta.png'),
                  Image.asset('assets/img/arabica.png'),
                ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              SizedBox(height: 10.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 22),
                  Text(
                    'KOPIPEDIA',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'GillSans',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              const Row(
                children: [
                  Expanded(
                    child: CardBeans(),
                  ),
                  Expanded(
                    child: CardKopi(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 22),
                  Text(
                    'EZ PZ KOPI',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'GillSans',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                children: itemList.map((item) {
                  int index = itemList.indexOf(item);
                  return CustomCard(
                    imagePath: 'assets/img/list_kopi/$item.jpg',
                    mainText: mainTextList[index],
                    subText: subTextList[index],
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

class CardBeans extends StatelessWidget {
  const CardBeans({Key? key});

  void _navigateToKopipedia(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Kopipedia()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => _navigateToKopipedia(context),
        child: Ink.image(
          image: AssetImage('assets/img/beans.png'),
          fit: BoxFit.fill,
          width: 180,
          height: 160,
        ),
      ),
    );
  }
}

class CardKopi extends StatelessWidget {
  const CardKopi({Key? key});

  void _navigateToKopipedia(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Kopipedia()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => _navigateToKopipedia(context),
        child: Ink.image(
          image: AssetImage('assets/img/coffe.png'),
          fit: BoxFit.fill,
          width: 180,
          height: 160,
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String mainText;
  final String subText;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 360,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'GillSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'GillSans',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    // Add the desired functionality when the button is pressed
                  },
                  child: Text('Pesan'),
                  style: TextButton.styleFrom(
                    backgroundColor: greyColor,
                    primary: Colors.white,
                    minimumSize: Size(80, 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'GillSans',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  void _navigateToKopipediaPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Kopipedia()));
  }

  void _navigateToTentangKamiPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TentangKami()));
  }

  void _navigateToEzPz(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EzpzPage()));
  }

  void _navigateToPaymentMethod(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PaymentMethod()));
  }

  void _navigateToAccountDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountDetail()),
    );
  }

  void _navigateToAddresess(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddresessPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: lightgreyColor,
            ),
            child: Container(
              height: 50.0,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 10.0),
                    Image.asset('assets/img/logo.png'),
                    SizedBox(height: 10.0),
                    Text(
                      'username',
                      style: TextStyle(
                          fontFamily: 'GillSans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/icons/People.png',
                    width: 24,
                    height: 24,
                  ),
                  title: GestureDetector(
                    onTap: () => _navigateToTentangKamiPage(context),
                    child: const Text(
                      'TENTANG KAMI',
                      style: TextStyle(
                          fontFamily: 'GillSans',
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/coffebeans.png',
                    width: 24,
                    height: 24,
                  ),
                  title: GestureDetector(
                    onTap: () => _navigateToKopipediaPage(context),
                    child: const Text(
                      'KOPIPEDIA',
                      style: TextStyle(
                          fontFamily: 'GillSans',
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/ezpzkopi.png',
                    width: 24,
                    height: 24,
                  ),
                  title: GestureDetector(
                    onTap: () => _navigateToEzPz(context),
                    child: Text(
                      'EZ PZ KOPI',
                      style: TextStyle(
                          fontFamily: 'GillSans',
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/cart.png',
                    width: 24,
                    height: 24,
                  ),
                  title: const Text(
                    'KERANJANG',
                    style: TextStyle(
                        fontFamily: 'GillSans',
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/card.png',
                    width: 24,
                    height: 24,
                  ),
                  title: GestureDetector(
                    onTap: () => _navigateToPaymentMethod(context),
                    child: Text(
                      'PAYMENT METHODS',
                      style: TextStyle(
                          fontFamily: 'GillSans',
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/accountdetails.png',
                      width: 24,
                      height: 24,
                    ),
                    title: GestureDetector(
                      onTap: () => _navigateToAccountDetails(context),
                      child: Text(
                        'ACCOUNT DETAILS',
                        style: TextStyle(
                            fontFamily: 'GillSans',
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    )),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/addresses.png',
                    width: 24,
                    height: 24,
                  ),
                  title: GestureDetector(
                    onTap: () => _navigateToAddresess(context),
                    child: Text(
                      'ADDRESESS',
                      style: TextStyle(
                          fontFamily: 'GillSans',
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/icons/logout.png', width: 24, height: 24),
                SizedBox(height: 10.0),
                Text(
                  'KELUAR',
                  style: TextStyle(
                    fontFamily: 'GillSans',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
