import 'package:brocoffe_moba/theme.dart';
import 'package:flutter/material.dart';
import 'package:brocoffe_moba/pages/home_page.dart';
import 'package:brocoffe_moba/main.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(TentangKami());
}

class TentangKami extends StatefulWidget {
  @override
  _TentangKamiState createState() => _TentangKamiState();
}

class _TentangKamiState extends State<TentangKami> {
  bool showAboutUsCard = true;

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
                'TENTANG KAMI',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GillSans',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Lebih kenal dengan orang dibalik layar Brocoffe',
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 10.0),
              if (showAboutUsCard) AboutUsCard(),
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

class AboutUsCard extends StatefulWidget {
  @override
  _AboutUsCardState createState() => _AboutUsCardState();
}

class _AboutUsCardState extends State<AboutUsCard> {
  int currentIndex = 0;
  List<Map<String, dynamic>> cards = [
    {
      'image': 'assets/img/tentangkami_brocoffe.png',
      'title': 'Jadi Penikmat Kopi Bukan Peminum Kopi',
      'description':
          'Kopi sebagai teman berfokus pada menit,menjadi teliti atas setiap detail. Semua yang dilakukan dianggap memberikan pengalaman kesederhanaan dengan substansi yang tak tertandingi.',
    },
    {
      'image': 'assets/img/tentangkami_yunolva.png',
      'title': 'Yunolva Anis Ramaziyah',
      'description':
          'Mbak-mbak yang biasa dipanggil Olpa oleh teman-temannya. Anak Informatika di Telkom University asal Kudus. Disini bertugas sebagai Front End dari Brocoffe. Hati-hati moodnya agak aneh',
    },
    {
      'image': 'assets/img/tentangkami_sulthon.png',
      'title': 'M Sulthon Sayid Abdurochman',
      'description':
          'Kalau ini namanya Sulthon. Sama anak Informatika dari Telkom University. Sebenarnya anak ini agak pindah-pindah tapi sekarang tinggal di Salatiga. Disini masnya yang mengurus Back End dari Brocoffe. Kalau udah tidur saran aja jangan diganggu',
    },
    {
      'image': 'assets/img/tentangkami_aziz.png',
      'title': 'M Aziz Al Adro Jalil',
      'description':
          'Anak Pariaman banget ini. Ni anak biasa dipanggil Aziz. Sama kek yang lain dia juga anak Informatika di Telkom University. Disini Brocoffe dia bertugas sebagai Front End. Keliatannya polos tapi ya tau lah',
    },
    {
      'image': 'assets/img/tentangkami_aufa.png',
      'title': 'Aufa Mutia',
      'description':
          'Kalau ini Aufa namanya. Dia dari Solo dan anaknya aktif banget lo di Telkom. Sama kaya temen-temen yang lain dia Informatika juga dan di Brocoffe ini dia megang Front End. Ini kalau mau jadi manusia yang lebih baik, banyak-banyak kenalan ma dia',
    },
    {
      'image': 'assets/img/tentangkami_lasman.png',
      'title': 'Lasman T Parlindungan Simbolon',
      'description':
          'Yak kalau ini namanya Lasman dari Yogyakarta. Dia juga anak Informatika di Telkom ni. Di Brocoffe dia yang ngerjain Desain, Prototype, dan Ide dasar dari Brocoffe. Kalau kata legenda YSSnya merupakan real legenda mitologi yunani',
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
      ]),
    );
  }
}
