import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Project_uts/login.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Tunggu 2 detik dan pindah ke halaman utama
    Timer(
      Duration(seconds: 10), // Ubah waktu menjadi 2 detik
      () {
        setState(() {
          isLoading = false; // Matikan indikator loading
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('Asset/Image/IMAKURI.png'), // Gambar
            if (isLoading) ...[
              SizedBox(height: 16), // Jarak antara gambar dan indikator loading
              CircularProgressIndicator(), // Indikator loading
            ],
          ],
        ),
      ),
    );
  }
}
