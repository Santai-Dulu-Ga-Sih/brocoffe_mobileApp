import 'package:brocoffe_moba/components/my_button.dart';
import 'package:brocoffe_moba/components/my_textfield.dart';
import 'package:brocoffe_moba/services/api_service.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistPage extends StatelessWidget {
  RegistPage({Key? key}) : super(key: key);

  Future<void> registerUser(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      final errorMessage = 'Username atau password tidak boleh kosong';
      print(errorMessage);
      // Tampilkan pesan kesalahan ke pengguna jika diperlukan
      return;
    }

    try {
      final response = await ApiService.register(username, password);

      if (response['success']) {
        final data = response['data'];
        // Berhasil mendaftar, lakukan penanganan sesuai kebutuhan Anda
        print('Registrasi berhasil: $data');
        // Tambahkan navigasi ke halaman berikutnya setelah registrasi berhasil
        _navigateToLoginPage(context);
      } else {
        final errorMessage = response['message'];
        print(errorMessage);
        // Tampilkan pesan kesalahan ke pengguna jika diperlukan
      }
    } catch (error) {
      final errorMessage = 'Registrasi gagal: $error';
      print(errorMessage);
      // Tampilkan pesan kesalahan ke pengguna jika diperlukan
    }
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
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
              'assets/img/Logo_app.png',
              width: 400,
            ),

            const SizedBox(height: 50),

            // Content
            Stack(
              children: [
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
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

                    const SizedBox(height: 50),

                    // Button
                    MyButton(
                      onTap: () => registerUser(context),
                      text_button: "Regist",
                    ),

                    // not a member? register now
                    const SizedBox(height: 300),
                    Text(
                      'Sudah punya akun?',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
