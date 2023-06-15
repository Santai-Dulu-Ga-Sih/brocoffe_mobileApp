import 'package:flutter/material.dart';
import 'package:brocoffe_moba/components/my_button.dart';
import 'package:brocoffe_moba/components/my_textfield.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';
import 'package:brocoffe_moba/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'regist_page.dart';

class UserData extends ChangeNotifier {
  String username;

  UserData({required this.username});

  void setUsername(String newUsername) {
    username = newUsername;
    notifyListeners();
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  void _navigateToRegistPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistPage()),
    );
  }

  void _navigateToDashboard(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    final response = await ApiService.login(username, password);
    final data = response.body.trim();
    final responseData = json.decode(data);

    if (response.statusCode == 200) {
      final data = response.body.trim();
      print(data);

      // Jika login berhasil, navigasikan ke dashboard
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            username: username,
          ),
        ),
      );
    } else if (responseData['message'] == 'error: invalid credentials') {
      Fluttertoast.showToast(
        msg: "Invalid username or password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/img/Logo_app.png',
                width: 400,
              ),
              const SizedBox(height: 50),
              MyTextField(
                labeltext: "Username",
                controller: usernameController,
                hintText: 'Masukkan username',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                labeltext: "Password",
                controller: passwordController,
                hintText: 'Masukkan password',
                obscureText: true,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Lupa password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              MyButton(
                onTap: () => _navigateToDashboard(context),
                text_button: "Login",
              ),
              const SizedBox(height: 150),
              Text(
                'Belum punya akun?',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () => _navigateToRegistPage(context),
                child: const Text(
                  'Daftar disini',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
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
