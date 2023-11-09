import 'package:flutter/material.dart';

import 'package:flutter_application_1/Project_uts/main.dart';
import 'package:flutter_application_1/Project_uts/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      // Tombol Register
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'Asset/Image/IMAKURI.png',
                height: 100.0,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Selamat Datang! Imakuri Project',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Untuk menyembunyikan password
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String enteredUsername = usernameController.text;
                String enteredPassword = passwordController.text;

                // Validasi input
                if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
                  _showErrorSnackBar("Username dan kata sandi harus diisi");
                  return;
                }

                // Periksa konfirmasi pengguna (gantilah ini dengan logika Anda)
                if (enteredUsername == "user" && enteredPassword == "root") {
                  // Jika login berhasil, lanjutkan ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Myapp()),
                  );
                } else {
                  // Jika login gagal, tampilkan pesan kesalahan
                  _showErrorSnackBar("Username atau kata sandi salah");
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Belum punya akun? Register di sini'),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3), // Durasi tampilan pesan kesalahan
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
