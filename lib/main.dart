import 'package:flutter/material.dart';
import 'package:brocoffe_moba/pages/home_page.dart';
import 'package:brocoffe_moba/pages/kopipedia.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
