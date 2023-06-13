import 'package:flutter/material.dart';

void main() {
  runApp(OrderHistory());
}

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final List<Map<String, dynamic>> data = [
    /*
    {'Nama': 'Kopi Susu', 'Tanggal': '25 Juni 2023'},
    {'Nama': 'Kopi Luwak', 'Tanggal': '30 Juni 2023'},
    {'Nama': 'Kopi Hitam', 'Tanggal': '3 Juli 2023'},
    {'Nama': 'Es Teh', 'Tanggal': '4 Juli 2023'},*/
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order',
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
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: data.isNotEmpty
                ? DataTable(
                    columns: [
                      DataColumn(
                        label: Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          child: const Text(
                            'Nama',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'GillSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          child: const Text(
                            'Tanggal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'GillSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(''),
                        numeric: false,
                        tooltip: 'Pesan Lagi',
                      ),
                    ],
                    rows: data.map((item) {
                      return DataRow(cells: [
                        DataCell(
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  item['Nama'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'GillSans',
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            alignment: Alignment.center,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  item['Tanggal'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'GillSans',
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataCell(
                          ElevatedButton(
                            child: Text('Pesan Lagi'),
                            onPressed: () {
                              // Aksi yang ingin dijalankan saat tombol ditekan
                              print('Tombol Pesan Lagi ditekan!');
                            },
                          ),
                        ),
                      ]);
                    }).toList(),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum ada order yang dapat ditampilkan',
                            style: TextStyle(
                              fontFamily: 'GillSans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'You haven\'t bought anything yet! Start by selecting a coffee that will surely make your day happy!',
                            style: TextStyle(
                              fontFamily: 'GillSans',
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    ));
  }
}
