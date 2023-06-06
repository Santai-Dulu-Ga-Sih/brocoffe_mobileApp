import 'package:brocoffe_moba/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PaymentMethod());
}

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  List<bool> itemCheckedList = [false, false, false];
  int selectedItemIndex = -1;

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
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16), // Jarak horizontal dari tepi
          child: Column(
            children: [
              PaymentItemList(
                imageList: const [
                  'assets/img/payment/image1.png',
                  'assets/img/payment/image2.png',
                  'assets/img/payment/image3.png',
                  'assets/img/payment/image4.png',
                ],
                bankNameList: const [
                  'DANA',
                  'GOPAY',
                  'SHOPEE',
                  'OVO',
                ],
                selectedItemIndex: selectedItemIndex,
                onItemSelected: (int index) {
                  setState(() {
                    selectedItemIndex = index;
                  });
                },
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: PaymentConfirmationButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentItemList extends StatelessWidget {
  final List<String> imageList;
  final List<String> bankNameList;
  final int selectedItemIndex;
  final Function(int) onItemSelected;

  PaymentItemList({
    required this.imageList,
    required this.bankNameList,
    required this.selectedItemIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(imageList.length, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                onItemSelected(index);
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 60, // Mengatur lebar untuk menggeser ke kanan
                      child: Image.asset(
                        imageList[index],
                        width: 52,
                        height: 52,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      // Mengatur lebar proporsional
                      child: Text(
                        bankNameList[index],
                        style: TextStyle(
                          fontFamily: 'GillSans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      selectedItemIndex == index
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank,
                      color: greyColor,
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class PaymentConfirmationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          // Menampilkan pop-up setelah tombol diklik
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Perubahan Metode Pembayaran',
                  style: TextStyle(
                    fontFamily: 'GillSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  'Metode pembayaran berhasil diubah!',
                  style: TextStyle(
                    fontFamily: 'GillSans',
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'Tutup',
                      style: TextStyle(
                        fontFamily: 'GillSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          primary: deepGreen,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Konfirmasi Cara Pembayaran',
          style: TextStyle(
            fontFamily: 'GillSans',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
