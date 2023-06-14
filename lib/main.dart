import 'package:brocoffe_moba/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brocoffe_moba/pages/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(username: ''),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
