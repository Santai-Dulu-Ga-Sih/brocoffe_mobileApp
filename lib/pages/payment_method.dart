import 'package:brocoffe_moba/theme.dart';
import 'package:flutter/material.dart';
import 'package:brocoffe_moba/pages/home_page.dart';
import 'package:brocoffe_moba/main.dart';

void main() {
  runApp(PaymentMethod());
}

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethod createState() => _PaymentMethod();
}

class _PaymentMethod extends State<PaymentMethod> {
  List<bool> itemCheckedList = [
    false,
    false,
    false
  ]; // Daftar status centang untuk setiap item

  int selectedItemIndex =
      -1; // Indeks item yang dipilih, -1 menunjukkan tidak ada yang dipilih

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
                    'PAYMENT METHODS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'GillSans',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              centerTitle: true, // Menengahkan judul di tengah AppBar
            ),
            body: ListView.builder(
              itemCount: itemCheckedList.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile(
                  title: Row(
                    children: [
                      Image.asset(
                        'assets/img/payment/image1.png',
                        width: 48,
                        height: 48,
                      ),
                      SizedBox(width: 12),
                      Text('Shopee'),
                    ],
                  ),
                  value: index,
                  groupValue: selectedItemIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedItemIndex = value ??
                          -1; // Memperbarui item yang dipilih saat nilai berubah
                    });
                  },
                );
              },
            )));
  }
}
