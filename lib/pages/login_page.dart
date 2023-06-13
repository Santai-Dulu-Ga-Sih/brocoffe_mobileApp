import 'package:flutter/material.dart';
import 'package:brocoffe_moba/components/my_button.dart';
import 'package:brocoffe_moba/components/my_textfield.dart';
import 'home_page.dart';

import 'regist_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  void _navigateToRegistPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegistPage()));
  }

  void _navigateToDashboard(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  // void signUserIn() {}

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

              // logo
              Image.asset(
                'assets/img/Logo_app.png',
                width: 400,
              ),

              const SizedBox(height: 50),

              // email textfield
              MyTextField(
                labeltext: "Username",
                controller: usernameController,
                hintText: 'Masukkan username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                labeltext: "Password",
                controller: passwordController,
                hintText: 'Masukkan password',
                obscureText: true,
              ),

              const SizedBox(height: 30),

              // forgot password?
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

              // sign in button
              MyButton(
                // onTap: signUserIn,
                onTap: () => _navigateToDashboard(context),
                text_button: "Login",
              ),

              const SizedBox(height: 150),

              // not a member? register now
              Text(
                'Belum punya akun?',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
