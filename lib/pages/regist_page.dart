import 'package:brocoffe_moba/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:brocoffe_moba/components/my_textfield.dart';
import 'login_page.dart';

class RegistPage extends StatelessWidget {
  RegistPage({super.key});

  void registUser() {}

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 100),
            // Logo
            Image.asset(
              'lib/images/Logo_app.png',
              width: 400,
            ),

            const SizedBox(height: 50),

            // Content
            Stack(children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(
                            0, 3), // changes the position of the shadow
                      )
                    ]),
              ),

              // Content
              Column(
                children: [
                  const SizedBox(height: 50),

                  //username
                  MyTextField(
                      labeltext: 'Username',
                      controller: usernameController,
                      hintText: 'Masukkan username',
                      obscureText: false),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    labeltext: "Password",
                    controller: passwordController,
                    hintText: 'Masukkan password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 50),

                  // Button
                  MyButton(onTap: registUser, text_button: "Regist"),

                  // not a member? register now
                  const SizedBox(height: 300),
                  Text(
                    'Sudah punya akun?',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => _navigateToLoginPage(context),
                    child: const Text(
                      'Masuk disini',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
