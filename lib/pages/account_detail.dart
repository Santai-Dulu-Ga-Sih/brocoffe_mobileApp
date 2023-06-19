import 'package:flutter/material.dart';

void main() {
  runApp(AccountDetail());
}

class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
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
            children: [
              Text(
                'ACCOUNT DETAIL',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 50),
              Image.asset(
                "assets/img/logokopi.png",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 50),
              Row(children: <Widget>[
                Container(height: 50, width: 30),
                Container(
                    height: 50,
                    width: 100,
                    child: Row(children: <Widget>[
                      Text(
                        "Nama",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'GillSans',
                          color: Colors.black,
                        ),
                      ),
                    ])),
                Container(
                    height: 50,
                    width: 370,
                    child: Row(children: <Widget>[
                      Text(
                        "Sulthon",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'GillSans',
                          color: Colors.black,
                        ),
                      ),
                    ])),
              ]),
              Row(children: <Widget>[
                Container(height: 50, width: 30),
                Container(
                    height: 50,
                    width: 100,
                    child: Row(children: <Widget>[
                      Text(
                        "Addresses",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'GillSans',
                          color: Colors.black,
                        ),
                      ),
                    ])),
                Container(
                    height: 50,
                    width: 370,
                    child: Wrap(children: <Widget>[
                      Text(
                        "Jl. H. Mansyur No.17K, RT.11/RW.04, Bojongsoang, Kec. Bojongsoang, Kabupaten Bandung, Jawa Barat 40288",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'GillSans',
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ])),
              ]),
              Row(children: <Widget>[
                Container(height: 50, width: 30),
                Container(
                    height: 50,
                    width: 100,
                    child: Row(children: <Widget>[
                      Text(
                        "Payment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'GillSans',
                          color: Colors.black,
                        ),
                      ),
                    ])),
                Container(
                    height: 50,
                    width: 370,
                    child: Row(children: <Widget>[
                      Text(
                        "SHOPEEPAY",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'GillSans',
                          color: Colors.black,
                        ),
                      ),
                    ])),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
